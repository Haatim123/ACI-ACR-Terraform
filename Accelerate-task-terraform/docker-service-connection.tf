resource "azuredevops_serviceendpoint_azurecr" "azure_acr" {
  project_id                = azuredevops_project.project.id
  service_endpoint_name     = "ACR Docker Registry Connection"
  resource_group            = var.resource_group_name
  azurecr_spn_tenantid      = var.tenant_id
  azurecr_name              = "TerraformACRforAccelerate"
  azurecr_subscription_id   = var.subscription_id
  azurecr_subscription_name = "Free Trial"
}