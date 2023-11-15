terraform {
  required_version = ">= 1.0"
}

module "this" {
  source = "../.."

  context = {
    project = {
      "name" = "project_name"
      "id"   = "project_id"
    }
    environment = {
      "name" = "environment_name"
      "id"   = "environment_id"
    }
    resource = {
      "name" = "resource_name"
      "id"   = "resource_id"
    }
  }

  selector = {
    "walrus.seal.io/project-id"       = "project_id"
    "walrus.seal.io/environment-id"   = "environment_id"
    "walrus.seal.io/resource-id"      = "resource_id"
    "walrus.seal.io/project-name"     = "project_name"
    "walrus.seal.io/environment-name" = "environment_name"
    "walrus.seal.io/resource-name"    = "resource_name"
  }

  endpoint_internal = ["example.default-test.example-dev-dns"]

  username = "your-username"
  password = "your-password"
}

output "context" {
  value = module.this.context
}

output "selector" {
  value = module.this.selector
}

output "endpoint_internal" {
  value = module.this.endpoint_internal
}

output "username" {
  value = module.this.username
}

output "password" {
  value     = module.this.password
  sensitive = true
}