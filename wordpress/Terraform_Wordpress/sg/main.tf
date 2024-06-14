#create security group for EC2 wordpress  
resource "aws_security_group" "sg" {
  vpc_id      = var.vpc_id
  name        = var.sg_name
  description = "Security group for WordPress"
  tags        = var.sg_tags

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#create security group for RDS
resource "aws_security_group" "rds_sg" {
  name        = var.rds_sg_name
  description = "Allow MySQL traffic from wordpress-sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.rds_sg_tags
}