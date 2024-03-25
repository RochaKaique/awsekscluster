resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.kaiquelab_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name        = "Internet rtb"
    Description = "Route table que fornece acesso ao igw"
  }
}

resource "aws_route_table_association" "a-1" {
  subnet_id      = aws_subnet.lab-public-a.id
  route_table_id = aws_route_table.rtb.id
}

resource "aws_route_table_association" "a-2" {
  subnet_id      = aws_subnet.lab-public-b.id
  route_table_id = aws_route_table.rtb.id
}