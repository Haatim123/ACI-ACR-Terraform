data "azurerm_subscription" "primary" {}

resource "azuredevops_serviceendpoint_azurerm" "azure_rm" {
  project_id            = azuredevops_project.project.id
  service_endpoint_name = "AzureRM Service Connection"
  
  credentials {
    serviceprincipalid  = azuread_service_principal.SP.application_id
    serviceprincipalkey = azuread_service_principal_password.SPP.value

  }

  azurerm_spn_tenantid        = data.azuread_client_config.current.tenant_id
  azurerm_subscription_id     = "df82b8cd-8439-4876-872b-584c5c7989f4"
  azurerm_subscription_name   = data.azurerm_subscription.primary.display_name
  description                 = "Service connection to Azure RM"
}