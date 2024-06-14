resource "aws_instance" "ec2" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [var.security_group_id]
  subnet_id       = element(var.public_subnet_ids, 0)
  tags = var.ec2_tags
  
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install -y php7.2
              yum install -y httpd mysql php php-mysqlnd wget
              systemctl start httpd
              systemctl enable httpd
              cd /var/www/html
              wget https://wordpress.org/latest.tar.gz
              tar -xzf latest.tar.gz
              cp -r wordpress/* .
              rm -rf wordpress latest.tar.gz
              chown -R apache:apache /var/www/html
              chmod -R 755 /var/www/html
              cp wp-config-sample.php wp-config.php
              sed -i "s/database_name_here/your_database_name/" wp-config.php
              sed -i "s/username_here/your_database_username/" wp-config.php
              sed -i "s/password_here/your_database_password/" wp-config.php
              sed -i "s/localhost/your_database_endpoint/" wp-config.php
              systemctl restart httpd
              EOF
}
