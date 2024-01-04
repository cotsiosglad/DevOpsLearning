terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "5.40.0"
    }
  }
}

provider "github" {
    token = var.token
}

# data "github_repository" "myRepo" {
#   full_name = "cotsiosglad/DevOpsLearning"
# }

# resource "github_branch" "development" {
#   repository = data.github_repository.myRepo.name
#   branch     = "MyInsaneBranch"
# }

# output "RepoID" {
#   value = data.github_repository.myRepo.repo_id
# }

# data "github_repositories" "repositories" {
# for_each = toset(var.Users)
#   query = "user:${each.value}"
#   include_repo_id = true
# }

# output "full_names" {
#   value = {
#     for username, repo in data.github_repositories.repositories : username => repo.full_names
#   }
# }

data "github_organization" "example" {
  name = "cotsiosglad"
}
output "org" {
  value = data.github_organization.example.repositories
}