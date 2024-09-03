resource "azuredevops_build_definition" "pipeline" {
  project_id = azuredevops_project.project.id
  name       = "MyPipeline"

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.repo.id
    branch_name = "refs/heads/master"  # Change this if your YAML is in a different branch
    yml_path    = "azure-pipelines.yml"
  }
}