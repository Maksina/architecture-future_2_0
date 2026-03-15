# -----------------------------------------------------------------------------
# Окружение: dev
# Вызов переиспользуемого модуля vm с параметрами из terraform.tfvars
# -----------------------------------------------------------------------------

terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.84"
    }
  }
}

provider "yandex" {
  zone = var.zone
}

module "vm" {
  source = "../../modules/vm"

  vm_name        = var.vm_name
  cores          = var.cores
  memory         = var.memory
  disk_size      = var.disk_size
  subnet_id      = var.subnet_id
  ssh_public_key = var.ssh_public_key

  zone             = var.zone
  image_family     = var.image_family
  disk_type        = var.disk_type
  assign_public_ip = var.assign_public_ip
}
