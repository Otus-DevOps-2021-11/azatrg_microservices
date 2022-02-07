provider "yandex" {
#   version = "~> 35.0"
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_compute_instance" "app" {
  name        = "${var.instance_name}-${count.index + 1}"
    labels = {
    tags = var.instance_name
  }
  platform_id = "standard-v1"
  zone        = var.zone
  count       = var.instance_count

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      type     = "network-ssd"
      size     = 10
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  connection {
    type  = "ssh"
    host  = "${self.network_interface.0.nat_ip_address}"
    user  = "ubuntu"
    agent = false
    private_key = file(var.private_key_path)
  }
}
