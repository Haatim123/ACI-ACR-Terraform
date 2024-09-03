output "sp_client_secret" {
    value = azuread_service_principal_password.SPP.value
    sensitive = true
}

output "app_client_secret" {
    value = azuread_application_password.AP.value
    sensitive = true
}

output "azure_devops_project_id" {
  description = "The Azure DevOps Project ID"
  value       = azuredevops_project.project.id
}

output "app_object_id" {
    value = azuread_application.tfAPI.object_id

}

output "app_app_id" {
    value = azuread_application.tfAPI.application_id

}

output "SP_object_id" {
    value = azuread_service_principal.SP.object_id

}

output "SP_app_id" {
    value = azuread_service_principal.SP.application_id

}

output "acr_username" {
  value = azurerm_container_registry.acr.admin_username
}

output "acr_password" {
  value = azurerm_container_registry.acr.admin_password
  sensitive = true
}