locals {
metadata = {
    serial-port-enable = "1"
    user-data = "${file("./cc.yml")}"
    }
env      = "http://${yandex_compute_instance.vm-1.network_interface[0].nat_ip_address}:8111"
}