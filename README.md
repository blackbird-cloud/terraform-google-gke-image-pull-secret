# terraform-google-gke-image-pull-secret

Handy module to create kubernetes image pull secret for private GCR image on GKE cluster

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.34.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.13.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.34.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.13.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.docker_pull_secret](https://registry.terraform.io/providers/hashicorp/google/4.34.0/docs/resources/project_iam_member) | resource |
| [google_service_account.docker_pull_secret](https://registry.terraform.io/providers/hashicorp/google/4.34.0/docs/resources/service_account) | resource |
| [google_service_account_key.docker_pull_secret](https://registry.terraform.io/providers/hashicorp/google/4.34.0/docs/resources/service_account_key) | resource |
| [kubernetes_secret.image_pull_secrets](https://registry.terraform.io/providers/hashicorp/kubernetes/2.13.1/docs/resources/secret) | resource |
| [google_client_config.provider](https://registry.terraform.io/providers/hashicorp/google/4.34.0/docs/data-sources/client_config) | data source |
| [google_container_cluster.my_cluster](https://registry.terraform.io/providers/hashicorp/google/4.34.0/docs/data-sources/container_cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Cluster name | `string` | `"aws-cluster-develop"` | no |
| <a name="input_gcr_domain"></a> [gcr\_domain](#input\_gcr\_domain) | Domain used for GCR | `string` | `"https://eu.gcr.io"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Kubernetes namespace to deploy image pull secret to | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Google Project ID | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Google Region | `string` | n/a | yes |
| <a name="input_service_account_display_name"></a> [service\_account\_display\_name](#input\_service\_account\_display\_name) | Service account display name | `string` | `""` | no |
| <a name="input_service_account_id"></a> [service\_account\_id](#input\_service\_account\_id) | ID for service account | `string` | `""` | no |

## Outputs

No outputs.
