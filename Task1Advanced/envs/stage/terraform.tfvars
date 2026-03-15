# -----------------------------------------------------------------------------
# Параметры для окружения stage (средние ресурсы для тестирования)
# -----------------------------------------------------------------------------

vm_name   = "future20-vm-stage"
cores     = 4
memory    = 4
disk_size = 50

subnet_id      = ""
ssh_public_key = ""

zone             = "ru-central1-a"
image_family     = "ubuntu-2204-lts"
disk_type        = "network-ssd"
assign_public_ip = true
