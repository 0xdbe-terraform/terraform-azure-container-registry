resource "random_integer" "main" {
  min     = 1
  max     = 999
}

resource "azurerm_container_registry" "main" {
  name                     = "acr-${lower(substr("${var.application_short_name}-${length(var.acr_purpose) > 0 ? "${var.acr_purpose}-" : ""}${var.application_environment}",0,45))}-${format("%000d",random_integer.main.result)}"
  resource_group_name      = var.resource_group_name
  location                 = var.azure_location
  sku                      = "Standard"
  admin_enabled            = false
}