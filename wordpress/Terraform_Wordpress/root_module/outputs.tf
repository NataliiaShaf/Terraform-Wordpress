output "sg_id" {
  value = module.security_groups.sg_id
}

output "security_groups" {
  value = module.security_groups.sg_id
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "nat_gateway_id" {
  value = module.vpc.nat_gateway_id
}

output "ec2_id" {
  value = module.ec2.ec2_id
}

output "mysql_endpoint" {
  value = module.mysql.db_instance_endpoint
}

output "rds_sg_id" {
  value = module.security_groups.rds_sg_id
}