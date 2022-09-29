region = "us-east-1"
general_tags = {
  Creator = "Oleksandr Stepanov"
  Project = "Home Task"
}
#-------------------------------------------ec2 module--------------------------------------------
instance_type                         = "t2.micro"
key_name                              = "tf-1task"
allow_ports                           = ["22", "80", "1256"]
instance_ami                          = "ami-05fa00d4c63e32376"
aws_instance_associate_public_address = true
#----------------------------------------networking module-----------------------------------------
vpc_1_instance_tenancy                  = "default"
vpc_1_cidr_block                        = "10.0.0.0/16"
public_subnet_1_cidr_block              = "10.0.1.0/24"
public_subnet_1_availability_zone       = "us-east-1a"
public_subnet_1_map_public_ip_on_launch = true
private_subnet_1_cidr_block             = "10.0.2.0/24"
private_subnet_1_availability_zone      = "us-east-1b"
eip_vpc                                 = true
