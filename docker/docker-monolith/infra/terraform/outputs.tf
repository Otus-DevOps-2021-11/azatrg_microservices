output "external_ip_address_host" {
  value = yandex_compute_instance.app[0].network_interface.0.nat_ip_address
}
