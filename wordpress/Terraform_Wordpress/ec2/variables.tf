variable "key_name" {
  type = string
  description = "SSH key name"
}

variable "ami_id" {
  type = string
  description = "AMI ID"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "Public subnet IDs"
  
}

variable "vpc_id" {
  type = string
  description = "VPC ID"
}

variable "instance_type" {
  type = string

}

variable "ec2_tags" {
  type = map(string)

}
variable "security_group_id" {
  description = "Security group ID for the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
}