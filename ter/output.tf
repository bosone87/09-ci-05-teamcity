output "vms_external_ip" {
value = tomap({
    teamcity-server  = "${yandex_compute_instance.vm-1.*.network_interface.0.nat_ip_address}"
    teamcity-agent   = "${yandex_compute_instance.vm-2.*.network_interface.0.nat_ip_address}"
    nexus-01         = "${yandex_compute_instance.vm-3.*.network_interface.0.nat_ip_address}"
})
}