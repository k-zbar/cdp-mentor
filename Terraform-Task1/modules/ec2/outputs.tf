output "webserver_public_ip" {
  value = aws_instance.webserver_public_1.public_ip
}

output "vpc_1_ec2_private_ip" {
  value = aws_instance.webserver_private_1.private_ip
}
