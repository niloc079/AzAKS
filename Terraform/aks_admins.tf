resource "azuread_group" "aks_administrators" {
  display_name      = "${var.environment}${var.application}${var.iteration}adm"
  description       = "Kubernetes administrators for the ${var.environment}${var.application}${var.iteration}clu cluster."
  security_enabled  = true
}