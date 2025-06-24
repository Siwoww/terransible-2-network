terraform {
  backend "s3" {
    bucket = "siwoww-temporary-bucket-name"
    key = "network/terraform.tfstate"
    region = var.region
  }
}

provider "aws" {
  region = var.region
}