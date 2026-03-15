output "vm_id" {
  description = "Идентификатор ВМ"
  value       = module.vm.vm_id
}

output "vm_name" {
  description = "Имя ВМ"
  value       = module.vm.vm_name
}

output "vm_fqdn" {
  description = "FQDN ВМ"
  value       = module.vm.vm_fqdn
}

output "private_ip" {
  description = "Приватный IP ВМ"
  value       = module.vm.private_ip
}

output "nat_ip" {
  description = "Публичный IP ВМ"
  value       = module.vm.nat_ip
}

output "disk_id" {
  description = "Идентификатор подключаемого диска"
  value       = module.vm.disk_id
}

output "disk_name" {
  description = "Имя подключаемого диска"
  value       = module.vm.disk_name
}

output "zone" {
  description = "Зона доступности ВМ"
  value       = module.vm.zone
}
