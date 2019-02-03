resource "aws_instance" "web" {
  ami = "${var.ami}"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  security_groups = [
      "${security_group.ssh}",
      "${security_group.http}"
  ]
  subnet_id = "${aws_subnet.public}"

  tags {
    Name = "${var.name}-ec2-web"
  }
}
