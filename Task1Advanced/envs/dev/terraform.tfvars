# -----------------------------------------------------------------------------
# Параметры для окружения dev (минимальные ресурсы для разработки)
# -----------------------------------------------------------------------------

vm_name   = "future20-vm-dev"
cores     = 2
memory    = 2
disk_size = 20

subnet_id      = ""
ssh_public_key = ""

zone             = "ru-central1-a"
image_family     = "ubuntu-2204-lts"
disk_type        = "network-ssd"
assign_public_ip = true
