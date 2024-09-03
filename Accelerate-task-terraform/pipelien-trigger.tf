resource "null_resource" "trigger_pipeline" {
  provisioner "local-exec" {
    command = <<EOT
    az pipelines run --name "MyPipeline" --project "Terraform-project-Accelerate" --organization "https://dev.azure.com/ResourceDeployment"
    EOT
  }

  depends_on = [
    azuredevops_serviceendpoint_azurecr.azure_acr,
    azuredevops_build_definition.pipeline
  ]
}