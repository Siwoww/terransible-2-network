resource "aws_vpc" "prod-vpc" {
  cidr_block = var.vpc_cidr["prod"]
  enable_dns_hostnames = true #verificare utilità
  enable_dns_support = true #verificare utilità

  tags = {
    Name = "prod-vpc"
  }

  lifecycle {
    create_before_destroy = true #Essendo l-igw dipendente dalla vpc, nel momento in cui si prova a cambiare un attributo che comporta la distruzione/creazione,
                                 #la distruzione si blocca. Inserendo invece il create_before_destroy l'igw viene associato alla nuova risorsa creata, staccandola dalla vecchia,
                                 #rendendone possibile la distruzione
  } 
}

resource "aws_internet_gateway" "prod-vpc-gw" {
  vpc_id = aws_vpc.prod-vpc.id

  tags = {
    Name = "prod-vpc-igw"
  }
}

resource "aws_route_table" "prod-public-rt" {
  vpc_id = aws_vpc.prod-vpc.id

  tags = {
    Name = "prod-public-rt"
  }
}

resource "aws_route_table_association" "prod-public-rt-association" {
  subnet_id = aws_subnet.prod-public-subnet.id
  route_table_id = aws_route_table.prod-public-rt.id
}

resource "aws_default_route_table" "prod-private-rt" {
  default_route_table_id = aws_vpc.prod-vpc.default_route_table_id
}

resource "aws_route" "prod-default-route" {
  route_table_id = aws_route_table.prod-public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.prod-vpc-gw.id
}

resource "aws_subnet" "prod-public-subnet" {
  vpc_id = aws_vpc.prod-vpc.id
  cidr_block = cidrsubnet(aws_vpc.prod-vpc.cidr_block, 8, 1)

  tags = {
    Name = "prod-public-subnet"
  }
}

resource "aws_subnet" "prod-private-subnet" {
  vpc_id = aws_vpc.prod-vpc.id
  cidr_block = cidrsubnet(aws_vpc.prod-vpc.cidr_block, 8, 2)
  
  tags = {
    Name = "prod-private-subnet"
  }
}