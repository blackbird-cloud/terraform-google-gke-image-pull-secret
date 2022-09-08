terraform {
  required_version = ">= 1"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.34.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.13.1"
    }
  }
}
