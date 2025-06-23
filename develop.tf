resource "aws_vpc" "develop-vpc" {
  cidr_block = var.vpc_cidr["develop"]
  enable_dns_hostnames = true #verificare utilità
  enable_dns_support = true #verificare utilità

  tags = {
    Name = "develop-vpc"
  }

  lifecycle {
    create_before_destroy = true #Essendo l-igw dipendente dalla vpc, nel momento in cui si prova a cambiare un attributo che comporta la distruzione/creazione,
                                 #la distruzione si blocca. Inserendo invece il create_before_destroy l'igw viene associato alla nuova risorsa creata, staccandola dalla vecchia,
                                 #rendendone possibile la distruzione
  } 
}

resource "aws_internet_gateway" "develop-vpc-gw" {
  vpc_id = aws_vpc.develop-vpc.id

  tags = {
    Name = "develop-vpc-igw"
  }
}

resource "aws_route_table" "develop-public-rt" {
  vpc_id = aws_vpc.develop-vpc.id

  tags = {
    Name = "develop-public-rt"
  }
}

resource "aws_route_table_association" "develop-public-rt-association" {
  subnet_id = aws_subnet.develop-public-subnet.id
  route_table_id = aws_route_table.develop-public-rt.id
}

resource "aws_default_route_table" "develop-private-rt" {
  default_route_table_id = aws_vpc.develop-vpc.default_route_table_id
}

resource "aws_route" "develop-default-route" {
  route_table_id = aws_route_table.develop-public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.develop-vpc-gw.id
}

resource "aws_subnet" "develop-public-subnet" {
  vpc_id = aws_vpc.develop-vpc.id
  cidr_block = cidrsubnet(aws_vpc.develop-vpc.cidr_block, 8, 1)

  tags = {
    Name = "develop-public-subnet"
  }
}

resource "aws_subnet" "develop-private-subnet" {
  vpc_id = aws_vpc.develop-vpc.id
  cidr_block = cidrsubnet(aws_vpc.develop-vpc.id, 8, 2)
  
  tags = {
    Name = "develop-private-subnet"
  }
}