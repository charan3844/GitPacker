variable "az_tenant_id" {
   type = string
   default = var.clientId
}

variable "az_subscription_id" {
  type = string
  default = var.subscriptionId
}

variable "az_client_id"  {
  type =string
  default = var.clientId
}

varible "az_client_secret" {
  type = string
  default = var.clientSecret
}


azure_resource_group_name   = "RG1"
azure_location        = "West US 3"
vm_size               = "Standard_B1s"
vm_image_publisher    = "MicrosoftWindowsServer"
vm_image_offer        = "WindowsServer"
vm_name               = "PackerImage"


