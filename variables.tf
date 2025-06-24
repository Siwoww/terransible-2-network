variable "region" {
  default = "eu-central-1"
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