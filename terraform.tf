terraform {
  cloud {
    organization = "gcx-sandbox"

    workspaces {
      name = "gcx-cicd-workspace"
    }
  }
  required_providers {
    genesyscloud = {
      source  = "mypurecloud/genesyscloud"
    }
  }
}

