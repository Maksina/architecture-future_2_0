# -----------------------------------------------------------------------------
# Пример конфигурации backend для окружения dev
# -----------------------------------------------------------------------------

bucket  = "terraform-state-bucket"
key     = "project/terraform/dev/terraform.tfstate"
region  = "ru-central1"

# Endpoint для S3-совместимого хранилища
endpoint = "https://minio.example.com"
skip_region_validation = true
skip_credentials_validation = true

