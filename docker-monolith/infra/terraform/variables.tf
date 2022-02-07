variable service_account_key_file {
  description = "key .json"
  default = "../yc-terraform-key.json"
}
variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  default     = "ru-central1-a"
}
variable image_id {
  description = "Disk image"
  default     = "fd8hjvnsltkcdeqjom1n"
}
variable subnet_id {
  description = "Subnet"
    default = "e9b2okmdlc8fp8b2m3i0"
}
variable instance_name {
  description = "Instance name"
  default     = "docker-host"
}
variable instance_count {
  description = "Number of instances"
  default     = 1
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
  default = "~/.ssh/appuser.pub"
}
variable private_key_path {
  # Описание переменной
  description = "Path to the private key used for ssh access"
    default = "~/.ssh/appuser"
}
