provider "google" {
  project = var.project
  region  = var.region
}

data "google_client_config" "provider" {}

data "google_container_cluster" "my_cluster" {
  name     = var.cluster_name
  location = var.region
  project  = var.project
}

provider "kubernetes" {
  host  = "https://${data.google_container_cluster.my_cluster.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate,
  )
}
