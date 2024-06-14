#create vpc module
module "vpc" {
  source = "../vpc"

  cidr_block           = "192.168.0.0/16"
  public_subnet_cidrs  = ["192.168.21.0/24", "192.168.22.0/24", "192.168.23.0/24"]
  private_subnet_cidrs = ["192.168.31.0/24", "192.168.32.0/24", "192.168.33.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b", "us-east-1c"]
  vpc_tags = {
    Name = "wordpress_vpc"
  }
  igw_tags = {
    Name = "wordpress_igw"
  }
  public_rt_tags = {
    Name = "wordpress_public_rt"
  }
  private_rt_tags = {
    Name = "wordpress_private_rt"
  }
  eip_tags = {
    Name = "wordpress_eip"
  }
  nat_gw_tags = {
    Name = "wordpress_nat_gw"
  }
}

# create sg module
module "security_groups" {
  source        = "../sg"
  vpc_id        = module.vpc.vpc_id
  sg_name       = "wordpress-sg"
  rds_sg_name   = "rds-sg"
  ingress_ports = [22, 80, 443]
  sg_tags = {
    Name = "wordpress_sg"
  }
  rds_sg_tags = {
    Name = "wordpress_rds_sg"
  }
}

#create ec2 module
module "ec2" {
  source            = "../ec2"
  instance_type     = "t3.micro"
  vpc_id            = module.vpc.vpc_id
  subnet_id         = element(module.vpc.public_subnet_ids, 0)
  security_group_id = module.security_groups.sg_id
  key_name          = "ec2keypair"
  ami_id            = "ami-0d191299f2822b1fa" # Amazon Linux 2 AMI ID 
  public_subnet_ids = module.vpc.public_subnet_ids
  ec2_tags = {
    Name = "wordpress_ec2"
  }

}

#create rds module
module "mysql" {
  source = "../rds"

  name_subnet_group = "wordpress-db-subnet-group"
  private_subnet_ids = module.vpc.private_subnet_ids
  allocated_storage  = "20"
  storage_type       = "gp2"
  engine             = "mysql"
  engine_version     = "5.7"
  instance_class     = "db.t3.micro"
  db_name            = "mydatabase"
  db_username        = "admin"
  db_password        = "adminadmin"
  db_tags = {
    Name = "wordpress-db"
  }
  rds_sg_id = module.security_groups.rds_sg_id
}