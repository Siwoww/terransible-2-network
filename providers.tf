terraform {
  backend "s3" {
    bucket = "siwoww-temporary-bucket-name"
    key = "network/terraform.tfstate"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = var.region
}