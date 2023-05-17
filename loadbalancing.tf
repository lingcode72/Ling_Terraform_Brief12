#Create Load Balancer
resource "azurerm_lb" "test" {
   name                = "loadBalancer"
   location            = azurerm_resource_group.Ling-Terraform-Brief12.location
   resource_group_name = azurerm_resource_group.Ling-Terraform-Brief12.name

   frontend_ip_configuration {
     name                 = "publicIPAddress"
     public_ip_address_id = azurerm_public_ip.test.id
   }
 }

#Create Backend Address Pool
 resource "azurerm_lb_backend_address_pool" "test" {
   loadbalancer_id     = azurerm_lb.test.id
   name                = "BackEndAddressPool"
 }

#create availability set
 resource "azurerm_availability_set" "avset" {
   name                         = "avset"
   location                     = azurerm_resource_group.Ling-Terraform-Brief12.location
   resource_group_name          = azurerm_resource_group.Ling-Terraform-Brief12.name
   platform_fault_domain_count  = 2
   platform_update_domain_count = 2
   managed                      = true
 }

#Create Loadbalancing Rules
resource "azurerm_lb_rule" "production-inbound-rules" {
  loadbalancer_id                = azurerm_lb.test.id
  resource_group_name            = azurerm_resource_group.Ling-Terraform-Brief12.name
  name                           = "ssh-inbound-rule"
  protocol                       = "Tcp"
  frontend_port                  = 22
  backend_port                   = 22
  frontend_ip_configuration_name = "publicIPAddress"
  probe_id                       = azurerm_lb_probe.ssh-inbound-probe.id
  backend_address_pool_ids        = ["${azurerm_lb_backend_address_pool.test.id}"]
}


#Create Probe
resource "azurerm_lb_probe" "ssh-inbound-probe" {
  resource_group_name = azurerm_resource_group.Ling-Terraform-Brief12.name
  loadbalancer_id     = azurerm_lb.test.id
  name                = "ssh-inbound-probe"
  port                = 22
}


#Automated Backend Pool Addition > Gem Configuration to add the network interfaces of the VMs to the backend pool.
resource "azurerm_network_interface_backend_address_pool_association" "test" {
  count                   = 2
  network_interface_id    = azurerm_network_interface.test.*.id[count.index]
  ip_configuration_name   = azurerm_network_interface.test.*.ip_configuration.0.name[count.index]
  backend_address_pool_id = azurerm_lb_backend_address_pool.test.id


}

