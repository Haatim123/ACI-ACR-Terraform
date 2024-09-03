variable "azure_devops_pat" {
  type = string
}

variable "resource_group_name" {
  type    = string
  default = "accelerate-terraform-rg"
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "subscription_id" {
  type = string
  default = ""
}

variable "tenant_id" {
  type = string
  default = ""
}

variable "owner_username" {
  type = string
}