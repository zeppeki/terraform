resource "aws_instance" "web" {
  ami = "${var.ami}"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  vpc_security_group_ids = [
      "${aws_security_group.ssh.id}",
      "${aws_security_group.http.id}",
      "${aws_security_group.vpc-inbound.id}"
  ]
  subnet_id = "${aws_subnet.public.id}"
 
  user_data = "${file("cloud_config.yml")}"
 
  tags {
    Name = "${var.name}-ec2-web"
  }
}
