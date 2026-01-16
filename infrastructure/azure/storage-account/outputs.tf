output "storage_account_id" {
  value = azurerm_storage_account.storage.id
}

output "storage_account_primary_endpoints" {
  value = azurerm_storage_account.storage.primary_location
}
