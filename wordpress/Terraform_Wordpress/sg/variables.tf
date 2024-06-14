variable "vpc_id" {
  type = string
}

variable "sg_name" {
  type = string
}

variable "sg_tags" {
  type = map(string)
}

variable "rds_sg_name" {
  type = string
}

variable "ingress_ports" {
  type = list(number)
}

variable "rds_sg_tags" {
  type = map(string)
}