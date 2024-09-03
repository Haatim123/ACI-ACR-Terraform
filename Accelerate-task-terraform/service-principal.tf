data "azuread_client_config" "current" {}

locals {
  app_owners=[
    data.azuread_client_config.current.object_id,
    data.azuread_user.owner.object_id
  ]
}

resource "azuread_application" "tfAPI" {
  display_name = "Terrafprm-created-app"
  owners       = local.app_owners
}

resource "azuread_service_principal" "SP" {
  application_id         = azuread_application.tfAPI.application_id
  app_role_assignment_required = false
  owners                       = local.app_owners
}

resource "azuread_service_principal_password" "SPP" {
  display_name = "principal-app"
  service_principal_id = azuread_service_principal.SP.object_id
  }

resource "azuread_application_password" "AP" {
  display_name = "client-app"
  application_object_id = azuread_application.tfAPI.object_id

  }

data "azuread_user" "owner" {
  user_principal_name = var.owner_username
}