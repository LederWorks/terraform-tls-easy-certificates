terraform {
  required_providers {
    tls = {
      source = "hashicorp/tls"
      version = ">= 3.1.0"
    }
  }
  required_version = ">= 0.15.1"
}

