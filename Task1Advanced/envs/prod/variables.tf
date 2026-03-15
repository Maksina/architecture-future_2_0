variable "vm_name" {
  description = "Имя виртуальной машины"
  type        = string
}

variable "cores" {
  description = "Количество ядер процессора"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Объём оперативной памяти в ГБ"
  type        = number
  default     = 2
}

variable "disk_size" {
  description = "Размер подключаемого диска в ГБ"
  type        = number
  default     = 15
}

variable "subnet_id" {
  description = "Идентификатор подсети (Subnet ID)"
  type        = string
}

variable "ssh_public_key" {
  description = "Публичный SSH-ключ для доступа к ВМ"
  type        = string
  sensitive   = true
}

variable "zone" {
  description = "Зона доступности"
  type        = string
  default     = "ru-central1-a"
}

variable "image_family" {
  description = "Семейство образа ОС "
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "disk_type" {
  description = "Тип подключаемого диска"
  type        = string
  default     = "network-ssd"
}

variable "assign_public_ip" {
  description = "Назначить ли ВМ публичный IP-адрес"
  type        = bool
  default     = true
}
