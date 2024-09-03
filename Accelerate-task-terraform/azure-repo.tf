resource "azuredevops_git_repository" "repo" {
  project_id = azuredevops_project.project.id
  name       = "Accelerate-Terraform" # Dynamically set repo name to project name

  initialization {
    init_type   = "Import"
    source_type = "Git"
    source_url  = "https://github.com/Haatim123/docker-hello-world-flask.git"
    
  }
}

resource "azuredevops_git_repository_file" "pipeline_yaml" {
  repository_id = azuredevops_git_repository.repo.id
  # project_id     = azuredevops_project.project.id
  #   file_path      = "azure-pipelines.yml"
  file    = "azure-pipelines.yml"
  content = <<EOF
# Docker
# Build and push an image to Azure Container Registry
# https://docs.microsoft.com/azure/devops/pipelines/languages/docker

trigger:
- master

resources:
- repo: self

variables:
  # Container registry service connection established during pipeline creation
  dockerRegistryServiceConnection: 'ACR Docker Registry Connection'
  imageRepository: 'docker-terraform-image'
  containerRegistry: 'TerraformACRforAccelerate.azurecr.io'
  dockerfilePath: '$(Build.SourcesDirectory)/Dockerfile'
  tag: 'latest'
  buildTag: '$(Build.BuildId)'

  # Agent VM image name
  vmImageName: 'ubuntu-latest'

stages:
- stage: Build
  displayName: Build and push stage
  jobs:
  - job: Build
    displayName: Build
    pool:
      vmImage: $(vmImageName)
    steps:
    - task: Docker@2
      displayName: Build and push an image to container registry
      inputs:
        command: buildAndPush
        repository: $(imageRepository)
        dockerfile: $(dockerfilePath)
        containerRegistry: $(dockerRegistryServiceConnection)
        tags: |
          $(tag)
          $(buildTag)

EOF
  
}