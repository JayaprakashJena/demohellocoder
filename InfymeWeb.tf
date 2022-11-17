
terraform {
  required_version = ">= 0.11"
  backend "azurem"{
    storage_account_name = "__terraformstorageaccount01__"
    container_name = "terraform01"
    key = "terraform.tfstate"
    access_key = "__storagekey01__"
    features{}
  }
  provider "azurerm" {
   features {}
 }
}

resource "azurerm_resource_group" "res-Jay_01" {
  name     = "Terraform-resources01"
  location = "East US"
}

resource "azurerm_service_plan" "AppServicePlan01" {
  name                = "AppPlan04"
  resource_group_name = azurerm_resource_group.res-Jay_01.name
  location            = azurerm_resource_group.res-Jay_01.location
  sku_name            = "S1"
  os_type             = "Windows"
}

