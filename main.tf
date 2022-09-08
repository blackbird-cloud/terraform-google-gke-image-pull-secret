# --------------------- Service account setup --------------------
locals {
  roles = [
    "roles/storage.objectViewer",
  ]
}

resource "google_service_account" "docker_pull_secret" {
  account_id   = var.service_account_id != "" ? var.service_account_id : "${var.namespace}-pull-secret"
  display_name = var.service_account_display_name != "" ? var.service_account_display_name : "${var.namespace}-pull-secret"
  project      = var.project
}

resource "google_project_iam_member" "docker_pull_secret" {
  count   = length(local.roles)
  role    = local.roles[count.index]
  member  = "serviceAccount:${google_service_account.docker_pull_secret.email}"
  project = var.project
}

resource "google_service_account_key" "docker_pull_secret" {
  service_account_id = google_service_account.docker_pull_secret.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}

# --------------------- docker pull secret for K8S --------------------

locals {
  docker_pull_secret = {
    ".dockerconfigjson" = jsonencode({
      "auths" : {
        "${var.gcr_domain}" : {
          email    = google_service_account.docker_pull_secret.email
          username = "_json_key"
          password = trimspace(base64decode(google_service_account_key.docker_pull_secret.private_key))
          auth     = base64encode(join(":", ["_json_key", base64decode(google_service_account_key.docker_pull_secret.private_key)]))
        }
      }
    })
  }
}

resource "kubernetes_secret" "image_pull_secrets" {
  metadata {
    name      = "docker-pull-secret"
    namespace = var.namespace
  }
  data = local.docker_pull_secret

  type = "kubernetes.io/dockerconfigjson"
}
