resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "${var.environment}${var.application}${var.iteration}clu"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags

  node_resource_group = "${var.environment}${var.application}${var.iteration}nderg"
  dns_prefix          = "${var.environment}${var.application}${var.iteration}k8s"
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version

  role_based_access_control_enabled = true

  identity {
    type = "SystemAssigned"
    }

  #network_profile {
  #  network_mode = "azure"
  #}

  #addon_profile {
  #  azure_policy { enabled = true }
  #  oms_agent {
  #    enabled                    = true
  #    log_analytics_workspace_id = azurerm_log_analytics_workspace.insights.id
  #  }
  #}

  default_node_pool {
    #availability_zones   = ["1", "2", "3"]
    tags                 = var.tags
    enable_auto_scaling  = true
    max_count            = 3
    min_count            = 1
    node_labels          = {}
    node_taints          = []
    name                 = "default"
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    os_disk_size_gb      = 1024
    vm_size              = "Standard_D2_v2"
  }

  #role_based_access_control {
  #  enabled = true
  #  azure_active_directory {
  #    managed                = true
  #    admin_group_object_ids = [azuread_group.aks_administrators.object_id]
  #  }
  #}
}