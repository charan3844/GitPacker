variable "Secretes" {
 type = string
}

variable "azure_resource_group_name" {}
variable "vm_image_publisher" {}
variable "vm_image_offer" {}
variable "vm_name" {}
variable "vm_size" {}

source "azure-arm" "AzureImage" {

  tenant_id                         = var.Secretes
  subscription_id                   = var.Secretes                  
  client_id                         = var.Secretes
  client_secret                     = var.Secretes

  build_resource_group_name         = var.azure_resource_group_name
  managed_image_name                = var.vm_name
  managed_image_resource_group_name = var.azure_resource_group_name

  image_publisher                   = var.vm_image_publisher
  image_offer                       = var.vm_image_offer
  vm_size                           = var.vm_size
  os_type                           = "Windows"
  image_sku                         = "2022-Datacenter"
  
  communicator                      = "winrm"
  winrm_insecure                    = true
  winrm_timeout                     = "5m"
  winrm_use_ssl                     = true
  winrm_username                    = "packer"
  winrm_password                    = "P@ssw0rd!"

    azure_tags = {
    dept = "Test"
    task = "Image deployment"
  }

}


build {
  sources = ["source.azure-arm.AzureImage"]

  provisioner "powershell" {
    inline = ["Add-WindowsFeature Web-Server", "while ((Get-Service RdAgent).Status -ne 'Running') { Start-Sleep -s 5 }", "while ((Get-Service WindowsAzureGuestAgent).Status -ne 'Running') { Start-Sleep -s 5 }", "& $env:SystemRoot\\System32\\Sysprep\\Sysprep.exe /oobe /generalize /quiet /quit", "while($true) { $imageState = Get-ItemProperty HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Setup\\State | Select ImageState; if($imageState.ImageState -ne 'IMAGE_STATE_GENERALIZE_RESEAL_TO_OOBE') { Write-Output $imageState.ImageState; Start-Sleep -s 10  } else { break } }"]
  }

  provisioner "shell-local" {
    inline  = ["echo ${env.Packer_Image_Creds}"]

  } 

}
