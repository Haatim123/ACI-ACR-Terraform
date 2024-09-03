terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0" # Adjust the version as needed
    }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "~> 0.10" # Adjust the version as needed
    }
     azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.15.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id # Specify the subscription ID here
  tenant_id       = var.tenant_id
}

provider "azuredevops" {
  org_service_url       = "https://dev.azure.com/ResourceDeployment/"
  personal_access_token = var.azure_devops_pat
}