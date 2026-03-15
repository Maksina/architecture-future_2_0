# Задание 1. Модульная инфраструктура для нескольких сред

Универсальный Terraform-модуль для создания виртуальных машин в разных окружениях (dev, stage, prod) без захардкоженных значений.

## Модуль vm

### Назначение

Модуль создаёт в Yandex Cloud:
- виртуальную машину с заданными CPU и RAM;
- отдельный подключаемый диск;
- сетевой интерфейс в указанной подсети;
- доступ по SSH по переданному публичному ключу.

### Входные параметры

|Переменная|Тип|Описание|
|---|---|---|
|vm_name|string|Имя виртуальной машины|
|cores|number|Количество ядер процессора|
|memory|number|Объём оперативной памяти|
|disk_size|number|Размер подключаемого диска|
|subnet_id|string|Идентификатор подсети|
|ssh_public_key|string|Публичный SSH-ключ для доступа к ВМ|
|zone|string|Зона доступности|
|image_family|string|Семейство образа ОС|
|disk_type|string|Тип подключаемого диска|
|assign_public_ip|bool|Назначить ли ВМ публичный IP-адрес|

### Выходные параметры

|Переменная|Описание|
|---|---|
|vm_id|Идентификатор виртуальной машины|
|vm_name|Имя виртуальной машины|
|vm_fqdn|FQDN виртуальной машины|
|private_ip|Внутренний IP-адрес ВМ|
|nat_ip|Публичный IP-адрес ВМ|
|disk_id|Идентификатор подключаемого диска|
|disk_name|Имя подключаемого диска|
|zone|Зона доступности ВМ|

## Окружения и конфигурация

|Окружение|Пример конфигурации|
|---|---|
|dev| 2 ядра, 2 ГБ RAM, 20 ГБ диск|
|stage| 4 ядра, 4 ГБ RAM, 50 ГБ диск|
|prod| 8 ядер, 16 ГБ RAM, 100 ГБ диск|

Перед применением в каждом окружении нужно задать:
- subnet_id
- ssh_public_key

## Запуск 

```bash
# Окружение dev
cd envs/dev
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars

# Окружение stage
cd envs/stage
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars

# Окружение prod
cd envs/prod
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```
