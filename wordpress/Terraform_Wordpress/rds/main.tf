resource "aws_db_subnet_group" "db_subnet_group" {
  name       = var.name_subnet_group
  subnet_ids = var.private_subnet_ids
  tags       = var.db_tags
}

#create db_instance_RDS
resource "aws_db_instance" "mysql" {
  allocated_storage      = var.allocated_storage
  storage_type           = var.storage_type
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  db_name                = var.db_name
  vpc_security_group_ids = [var.rds_sg_id]
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  skip_final_snapshot    = true
  tags                   = var.db_tags
}