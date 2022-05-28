#Rout Tables creation
resource "aws_route_table" "Public-RT" {
  vpc_id = aws_vpc.default.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }

  tags = {
    Name = "${var.vpc_name}-Public-RT"
  }
}

resource "aws_route_table" "Private-RT" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = "${var.vpc_name}-Private-RT"
  }
}

#RT-Subnets Association
resource "aws_route_table_association" "Public-RT" {
  count          = 3
  subnet_id      = element(aws_subnet.public-subnets.*.id, count.index) # Splat syntax (.*.)
  route_table_id = aws_route_table.Public-RT.id
}

resource "aws_route_table_association" "Private-RT" {
  count          = 3
  subnet_id      = element(aws_subnet.private-subnets.*.id, count.index) # Splat syntax (.*.)
  route_table_id = aws_route_table.Private-RT.id
}
