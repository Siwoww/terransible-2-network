#DEVELOP
resource "aws_security_group" "develop-security-group" {
    name = "develop-security-group"
    vpc_id = aws_vpc.develop-vpc.id
}

resource "aws_vpc_security_group_ingress_rule" "develop-ingress-rule" {
    security_group_id = aws_security_group.develop-security-group.id

    cidr_ipv4 = var.develop-ingress-cidr-block
    ip_protocol = "-1"
    
    tags = {
      Name = "develop-ingress-rule"
    }
}

resource "aws_vpc_security_group_egress_rule" "develop-egress-rule" {
    security_group_id = aws_security_group.develop-security-group.id

    cidr_ipv4 = var.develop-egress-cidr-block
    ip_protocol = "-1"
    
    tags = {
      Name = "develop-egress-rule"
    }
}

#PROD
resource "aws_security_group" "prod-security-group" {
    name = "prod-security-group"
    vpc_id = aws_vpc.prod-vpc.id
}

resource "aws_vpc_security_group_ingress_rule" "prod-ingress-rule" {
    security_group_id = aws_security_group.prod-security-group.id

    cidr_ipv4 = var.prod-ingress-cidr-block
    ip_protocol = "-1"
    
    tags = {
      Name = "prod-ingress-rule"
    }
}

resource "aws_vpc_security_group_egress_rule" "prod-egress-rule" {
    security_group_id = aws_security_group.prod-security-group.id

    cidr_ipv4 = var.prod-egress-cidr-block
    ip_protocol = "-1"
    
    tags = {
      Name = "prod-egress-rule"
    }
}