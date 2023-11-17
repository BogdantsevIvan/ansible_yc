 variable "greet" {
  type = string
  default = "strawberry"
}

variable "folderId" {
  type = string
  default = "folderId"
}

variable "OAuth" {
  type = string
  default = "catalogId"
}

variable "subnetId" {
  type = string
  default = "subnetId"
}

 source "yandex" "ubuntu-greeting" {
   token               = var.OAuth 
   folder_id           = var.folderId 
   source_image_family = "ubuntu-2004-lts"
   ssh_username        = "ubuntu"
   use_ipv4_nat        = "true"
   image_description   = "my custom ubuntu with greeting"
   image_family        = "ubuntu-2004-lts"
   image_name          = "my-ubuntu-greeting"
   subnet_id           = var.subnetId 
   disk_type           = "network-ssd"
   zone                = "ru-central1-a"
 }

 build {
   sources = ["source.yandex.ubuntu-greeting"]

   provisioner "shell" {
     inline = [" sudo bash -c 'echo ${var.greet} | sudo tee /etc/motd'"]
   }
 }
 