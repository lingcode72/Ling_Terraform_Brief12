
#Create Virtual Networks > Create Spoke Virtual Network

  resource "azurerm_virtual_network" "test" {
   name                = "acctvn"
   address_space       = ["10.0.0.0/16"]
   location            = azurerm_resource_group.Ling-Terraform-Brief12.location
   resource_group_name = azurerm_resource_group.Ling-Terraform-Brief12.name
 }

#Create Subnet
 resource "azurerm_subnet" "test" {
   name                 = "acctsub"
   resource_group_name  = azurerm_resource_group.Ling-Terraform-Brief12.name
   virtual_network_name = azurerm_virtual_network.test.name
   address_prefixes     = ["10.0.2.0/24"]
 }

#create Ip addresse
 resource "azurerm_public_ip" "test" {
   name                         = "publicIPForLB"
   location                     = azurerm_resource_group.Ling-Terraform-Brief12.location
   resource_group_name          = azurerm_resource_group.Ling-Terraform-Brief12.name
   allocation_method            = "Static"
 }
 
 #Create Private Network Interfaces
resource "azurerm_network_interface" "test" {
   count               = 2
   name                = "Ubuntu${count.index}"
   location            = azurerm_resource_group.Ling-Terraform-Brief12.location
   resource_group_name = azurerm_resource_group.Ling-Terraform-Brief12.name

   ip_configuration {
     name                          = "testConfiguration"
     subnet_id                     = azurerm_subnet.test.id
     private_ip_address_allocation = "dynamic"
   }
 }


