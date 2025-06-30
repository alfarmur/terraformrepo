resource "aws_vpc" "devname" {
  cidr_block = "10.0.0.0/16"
  tags = { Name = "test_Server"}
}

# resource "aws_subnet" "publicname" {
#   vpc_id = aws_vpc.devname.id
#   cidr_block = "10.0.1.0/24"
#   tags = {Name = "public_subnet"}
# }

resource "aws_subnet" "pubname" {
  vpc_id = aws_vpc.devname.id
  cidr_block = "10.0.2.0/24"
  tags = { Name = "pub_subnet"}
}

resource "aws_internet_gateway" "igdevname" {
  vpc_id = aws_vpc.devname.id
}

resource "aws_route_table" "rtdevname" {
  vpc_id = aws_vpc.devname.id

  route {
    cidr_block="0.0.0.0/0"
    gateway_id = aws_internet_gateway.igdevname.id
  }
}

resource "aws_route_table_association" "rtassoname" {
  route_table_id = aws_route_table.rtdevname.id
  subnet_id = aws_subnet.pubname.id
}

resource "aws_security_group" "sgname" {
  name = "sgname"
  vpc_id = aws_vpc.devname.id
  tags = { name ="sg_devname"}

  ingress { 
    description = "tls from vpc"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress { 
    description = "tls from vpc"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "dev" {

    ami = "ami-0d03cb826412c6b0f"
    instance_type = "t2.small"
    key_name = "newkey"
    subnet_id = aws_subnet.pubname.id
    vpc_security_group_ids = [aws_security_group.sgname.id]

    tags = { name = "dev2_server"}

    associate_public_ip_address = true
}
  
  

