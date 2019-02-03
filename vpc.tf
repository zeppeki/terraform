resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"  
}

resource "aws_route" "internet_access" {
  route_table_id = "${aws_vpc.vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0"
  gateway_id = "${aws_internet_gateway.igw.id}"
}

resource "aws_subnet" "subnet" {
  vpc_id = "{$aws_vpc.vpc.id}"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
}
