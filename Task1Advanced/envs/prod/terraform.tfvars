# -----------------------------------------------------------------------------
# Параметры для окружения prod (увеличенные ресурсы для продакшена)
# -----------------------------------------------------------------------------

vm_name   = "future20-vm-prod"
cores     = 8
memory    = 16
disk_size = 100

subnet_id      = ""
ssh_public_key = ""

zone             = "ru-central1-a"
image_family     = "ubuntu-2204-lts"
disk_type        = "network-ssd"
assign_public_ip = true
