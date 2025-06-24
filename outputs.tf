#DEVELOP
output "develop_vpc_id" {
  value = aws_vpc.develop-vpc.id
}

output "develop_private_subnet-id" {
  value = aws_subnet.develop-private-subnet.id
}

output "develop_public_subnet_id" {
  value = aws_subnet.develop-public-subnet.id
}

output "develop_security_group_id" {
  value = aws_security_group.develop-security-group.id
}

#PROD
output "prod_vpc_id" {
  value = aws_vpc.prod-vpc.id
}

output "prod_private_subnet_id" {
  value = aws_subnet.prod-private-subnet.id
}

output "prod_public_subnet_id" {
  value = aws_subnet.prod-public-subnet.id
}

output "prod_security_group_id" {
  value = aws_security_group.prod-security-group.id
}