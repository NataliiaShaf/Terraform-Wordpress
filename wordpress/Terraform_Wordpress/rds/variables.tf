variable "private_subnet_ids" {
  type = list(string)
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}

variable "rds_sg_id" {
  type        = string
  description = "RDS Security Group ID"
}

variable "db_tags" {
  type = map(string)
}

variable "name_subnet_group" {
  type = string
}

variable "allocated_storage" {
  type = string
}

variable "storage_type" {
  type = string
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "db_name" {
  type = string
}