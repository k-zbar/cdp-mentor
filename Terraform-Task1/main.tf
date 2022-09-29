provider "aws" {
  region = var.region
}

module "networking" {
  source                                  = "./modules/networking"
  instance_ami                            = var.instance_ami
  instance_type                           = var.instance_type
  key_name                                = var.key_name
  allow_ports                             = var.allow_ports
  general_tags                            = var.general_tags
  vpc_1_instance_tenancy                  = var.vpc_1_instance_tenancy
  vpc_1_cidr_block                        = var.vpc_1_cidr_block
  public_subnet_1_cidr_block              = var.public_subnet_1_cidr_block
  public_subnet_1_availability_zone       = var.public_subnet_1_availability_zone
  public_subnet_1_map_public_ip_on_launch = var.public_subnet_1_map_public_ip_on_launch
  private_subnet_1_cidr_block             = var.private_subnet_1_cidr_block
  private_subnet_1_availability_zone      = var.private_subnet_1_availability_zone
  eip_vpc                                 = var.eip_vpc
}

module "ec2" {
  source                                = "./modules/ec2"
  instance_ami                          = var.instance_ami
  instance_type                         = var.instance_type
  key_name                              = var.key_name
  general_tags                          = var.general_tags
  sg_public_1_id                        = module.networking.sg_public_1_id
  sg_private_1_id                       = module.networking.sg_private_1_id
  vpc_1_public_subnet                   = module.networking.vpc_1_public_subnet
  vpc_1_private_subnet                  = module.networking.vpc_1_private_subnet
  aws_instance_associate_public_address = var.aws_instance_associate_public_address
}
