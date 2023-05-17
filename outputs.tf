#output location name
output "location" {
  value = azurerm_resource_group.Ling-Terraform-Brief12.location
}

#output resource group name
output "resource_group_name" {
  value = azurerm_resource_group.Ling-Terraform-Brief12.name
}

#output VM1 ip address
output "private_ip_address_allocation" {
  value = azurerm_virtual_machine.test[0].name
}
#output VM2 ip address
output "private_ip_address_allocation2" {
  value = azurerm_virtual_machine.test[1].name
}

#output balancer ip address
output "Ip_loadbalancer" {
  value = azurerm_public_ip.test.id
}

