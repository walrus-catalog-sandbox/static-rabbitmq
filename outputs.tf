locals {
  endpoints = flatten([
    for c in var.hosts : format("%s:%d", c, var.port)
  ])
}

#
# Orchestration
#

output "context" {
  description = "The input context, a map, which is used for orchestration."
  value       = var.context
}

output "refer" {
  description = "The refer, a map, including hosts, ports and account, which is used for dependencies or collaborations."
  sensitive   = true
  value = {
    schema = "static:rabbitmq"
    params = {
      selector  = {}
      hosts     = var.hosts
      port      = var.port
      endpoints = local.endpoints
      username  = var.username
      password  = nonsensitive(var.password)
    }
  }
}

#
# Reference
#

output "connection" {
  description = "The connection, a string combined host and port, might be a comma separated string or a single string."
  value       = join(",", local.endpoints)
}

output "address" {
  description = "The address, a string only has host, might be a comma separated string or a single string."
  value       = join(",", var.hosts)
}

output "port" {
  description = "The port of the service."
  value       = var.port
}

output "username" {
  description = "The username of the account to access the service."
  value       = var.username
}

output "password" {
  value       = var.password
  description = "The password of the account to access the service."
  sensitive   = true
}
