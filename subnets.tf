#Create Public and Private subnets using count , elemnet ,length functions.
resource "aws_subnet" "public-subnets" {
  count             = length(var.public_cidrblocks) # length of a list
  vpc_id            = aws_vpc.default.id
  availability_zone = element(var.azs, count.index)
  cidr_block        = element(var.public_cidrblocks, count.index)
  tags = {
    Name = "${var.vpc_name}-PublicSubnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private-subnets" {
  count             = length(var.private_cidrblocks)
  vpc_id            = aws_vpc.default.id
  availability_zone = element(var.azs, count.index)
  cidr_block        = element(var.private_cidrblocks, count.index)
  tags = {
    Name = "${var.vpc_name}-PrivateSubnet-${count.index + 1}"
  }
}
