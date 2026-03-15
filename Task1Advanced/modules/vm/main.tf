# Образ ОС по семейству
data "yandex_compute_image" "image" {
  family = var.image_family
}

# Подключаемый диск 
resource "yandex_compute_disk" "attachable_disk" {
  name       = "${var.vm_name}-data"
  type       = var.disk_type
  zone       = var.zone
  size       = var.disk_size
}

# Виртуальная машина
resource "yandex_compute_instance" "vm" {
  name        = var.vm_name
  zone        = var.zone

  resources {
    cores         = var.cores
    memory        = var.memory
  }

  boot_disk {
    disk_id = yandex_compute_disk.vm.id
  }


  network_interface {
    subnet_id          = var.subnet_id
    nat                = var.assign_public_ip
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_public_key}"
  }

}