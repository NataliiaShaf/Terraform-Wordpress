variable "cidr_block" {
  type        = string
  description = "cidr block fot vpc"
}

variable "vpc_tags" {
  type = map(string)
}

variable "igw_tags" {
  type = map(string)
}

variable "public_rt_tags" {
  type = map(string)
}

variable "private_rt_tags" {
  type = map(string)
}

variable "eip_tags" {
  type = map(string)
}

variable "nat_gw_tags" {
  type = map(string)
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}