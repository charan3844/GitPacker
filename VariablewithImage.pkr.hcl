variable "tenant_id" {}
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}


source "azure-arm" "AzureImage" {
 
  tenant_id                         = env.tenant_id
  subscription_id                   = env.subscription_id
  client_id                         = env.client_id
  client_secret                     = env.client_secret


  build_resource_group_name         = RG1
  managed_image_name                = PackerImage              
  managed_image_resource_group_name = RG1

  image_publisher                   = MicrosoftWindowsServer
  image_offer                       = WindowsServer        
  vm_size                           = Standard_B1s
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

}
