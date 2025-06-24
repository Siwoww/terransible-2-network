variable "region" {
  default = "eu-central-1"
}

variable "vpc_cidr" {
  default = {
    develop = "10.100.1.0/16"
    prod = "10.200.1.0/16"
  }
}

#DEVELOP
variable "develop-ingress-cidr-block" {
  default = "0.0.0.0/0"
}

variable "develop-egress-cidr-block" {
  default = "0.0.0.0/0"
}

#PROD
variable "prod-ingress-cidr-block" {
  default = "0.0.0.0/0"
}

variable "prod-egress-cidr-block" {
  default = "0.0.0.0/0"
}