#DEVELOP
output "develop-vpc-id" {
  value = aws_vpc.develop-vpc.id
}

output "develop-private-subnet-id" {
  value = aws_subnet.develop-private-subnet.id
}

output "develop-public-subnet-id" {
  value = aws_subnet.develop-public-subnet.id
}

output "develop-security-group-id" {
  value = aws_security_group.develop-security-group.id
}

#PROD
output "prod-vpc-id" {
  value = aws_vpc.prod-vpc.id
}

output "prod-private-subnet-id" {
  value = aws_subnet.prod-private-subnet.id
}

output "prod-public-subnet-id" {
  value = aws_subnet.prod-public-subnet.id
}

output "prod-security-group-id" {
  value = aws_security_group.prod-security-group.id
}