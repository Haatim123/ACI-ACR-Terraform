resource "azuredevops_project" "project" {
  name        = "Terraform-project-Accelerate"
  description = "Terraform managed Azure DevOps Project"
  visibility  = "private"
}