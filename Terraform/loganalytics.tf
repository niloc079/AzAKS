resource "azurerm_log_analytics_workspace" "loganalytics" {
  name                = "${var.environment}${var.application}${var.iteration}law"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
  retention_in_days   = 30
}