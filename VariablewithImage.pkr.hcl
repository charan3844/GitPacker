source "azure-arm" "AzureImage" {

  tenant_id                         = "2f8cca38-1d2f-4b01-87d0-ed2237ee2d6a"
  subscription_id                   = "046382f3-e29e-45cc-a9f7-0cfa89f92f46"
  client_id                         = "0edfbf0c-1356-4cfc-98c4-4f1c31068308"
  client_secret                     = "q.w8Q~0YgvNTO1s7ynJAoSJKYbCSUvQ~pjBA7c59"

  build_resource_group_name         = "CSGrg"
  managed_image_name                = "CSGtestpackerimage"
  managed_image_resource_group_name = "CSGrg"

  image_publisher                   = "MicrosoftWindowsServer"
  image_offer                       = "WindowsServer"
  vm_size                           = "Standard_B1s"
  os_type                           = "Windows"
  image_sku                         = "2022-Datacenter"
 
  
  communicator                      = "winrm"
  winrm_insecure                    = true
  winrm_timeout                     = "5m"
  winrm_use_ssl                     = true
  winrm_username                    = "packer"
  winrm_password                    = "P@$$w0rd"

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
