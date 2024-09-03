resource "null_resource" "wait_for_image" {
  provisioner "local-exec" {
    command = "sleep 180"  # Sleep for 180 seconds (3 minutes)
  }

  depends_on = [null_resource.trigger_pipeline]
}



resource "azurerm_container_group" "container_group" {
  depends_on = [null_resource.wait_for_image]
  name                = "terraform-container-instances"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type              = "Linux"

  container {
    name   = "myterraformcontainer"
    image  = "${azurerm_container_registry.acr.login_server}/docker-terraform-image:latest"  # Image from ACR
    cpu    = "1"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }


    # Optional: Environment variables
    environment_variables = {
      ENV_VAR = "value"
    }
   }

  tags = {
    environment = "testing"
  }

  # Credentials to access the ACR
  image_registry_credential {
    server   = azurerm_container_registry.acr.login_server
    username = azurerm_container_registry.acr.admin_username
    password = azurerm_container_registry.acr.admin_password
  }
}
