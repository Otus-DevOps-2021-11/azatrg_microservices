terraform {

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "azatrg-otus-infra"
    region     = "us-east-1"
    key        = "terraform/stage/state/terraform.tfstate"
    access_key = "QS9M-8FAPgoHvG7j6owi"
    secret_key = "pT1eoJxvvjVMn7KCh2uPmRIqoQyUviNEzgH7y1L8"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
