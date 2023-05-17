output "location" {
  value = azurerm_resource_group.Ling-Terraform-Brief12.location
}

output "resource_group_name" {
  value = azurerm_resource_group.Ling-Terraform-Brief12.name
}


output "private_ip_address_allocation" {
  value = azurerm_virtual_machine.test[0].name
}

output "private_ip_address_allocation2" {
  value = azurerm_virtual_machine.test[1].name
}

output "Ip_loadbalancer" {
  value = azurerm_public_ip.test.id
}

