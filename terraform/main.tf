terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "~>1.29.4"
    }
  }
}

# Configure the Linode Provider
provider "linode" {
  token = var.token
}

resource "linode_lke_cluster" "trendyapp-cluster" {
    label       = "trendyapp-cluster"
    k8s_version = "1.24"
    region      = "eu-central"
    tags        = ["prod"]

    pool {
        type  = "g6-standard-2"
        count = 3

        autoscaler {
          min = 3
          max = 10
        }
    }

  # Prevent the count field from overriding autoscaler-created nodes
  lifecycle {
    ignore_changes = [
      pool.0.count
    ]
  }
}

variable "token" {}