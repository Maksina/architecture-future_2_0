# Задание 2. Интеграция с CI/CD и удалённым хранением состояния

Terraform-код с backend в S3-совместимом хранилище и пайплайн CI/CD (GitHub Actions).

## 1. Удалённое хранение состояния (backend)

### Назначение

Состояние Terraform хранится в S3-совместимом хранилище.

### Используемое хранилище

**Minio**

### Конфигурация backend

В коде задаётся только тип backend и опции шифрования. Параметры хранилища передаются через конфиг backend, чтобы не хранить их в коде и не коммитить секреты.

**Локальный запуск**
```bash
cd envs/dev
terraform init -backend-config=example.hcl -reconfigure
terraform plan -var-file=example.tfvars
terraform apply -var-file=example.tfvars
```

## 2. CI/CD-пайплайн (GitHub Actions)

### Файл пайплайна

.github/workflows/terraform.yml

### Этапы

|Этап|Действие|
|---|---|
|Checkout|Клонирование репозитория|
|Setup Terraform|Установка Terraform|
|Terraform Format|Проверка форматирования|
|Configure Backend| Формирование конфига backend из GitHub Secrets|
|Terraform Init|Инициализация с удалённым backend |
|Terraform Validate|Валидация|
|Prepare tfvars|Подготовка terraform.tfvars|
|Terraform Plan|Выполнение terraform plan -var-file=terraform.tfvars -out=tfplan|
|Comment Plan on PR| В PR добавляется комментарий с выводом plan |
|Terraform Apply|Выполнение terraform apply -auto-approve tfplan только для main и после ручного подтверждения|


### Когда запускается

- Push и Pull Request в ветку main при изменении файлов в Task2Advanced/
- Ручной запуск

### Секреты репозитория (GitHub Secrets)

|Секрет|Назначение|
|---|---|
|TF_STATE_BUCKET|Имя бакета для состояния|
|TF_STATE_KEY|Ключ объекта состояния|
|TF_STATE_REGION|Регион|
|TF_STATE_ENDPOINT|URL S3-совместимого API|
|TF_STATE_ACCESS_KEY|Ключ доступа|
|TF_STATE_SECRET_KEY|Секретный ключ|
|YC_TOKEN|OAuth-токен Yandex Cloud|