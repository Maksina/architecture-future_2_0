terraform {
  backend "s3" {
    encrypt        = true
    dynamodb_table = null 
  }
}
