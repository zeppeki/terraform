resource "aws_instance" "web" {
  ami = "${var.ami}"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  vpc_security_group_ids = [
      "${aws_security_group.ssh.id}"
  ]
  subnet_id = "${aws_subnet.public.id}"

  tags {
    Name = "${var.name}-ec2-web"
  }
}
