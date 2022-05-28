#EC2 Servers Creation
resource "aws_instance" "Public-Servers" {
  count                       = 3                                 #create 3 servers
  ami                         = lookup(var.imageids, "us-east-1") # get lookup value from map of imageid variable
  instance_type               = "t2.micro"
  key_name                    = "AWS"
  subnet_id                   = element(aws_subnet.public-subnets.*.id, count.index) #get index from list
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name = "${var.vpc_name}-Public-Server-${count.index + 1}"
    Env  = var.environment
  }
  user_data = <<-EOF
		#! /bin/bash
        sudo apt-get update
		sudo apt-get install -y nginx
		echo "<h1>"${var.vpc_name}-Public-Server-${count.index + 1}"</h1>" | sudo tee /var/www/html/index.nginx-debian.html
	EOF
}

resource "aws_instance" "Private-Servers" {
  count                       = 3
  ami                         = lookup(var.imageids, "us-east-1")
  instance_type               = "t2.micro"
  key_name                    = "AWS"
  subnet_id                   = element(aws_subnet.private-subnets.*.id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name = "${var.vpc_name}-Private-Server-${count.index + 1}"
    Env  = var.environment
  }
}
