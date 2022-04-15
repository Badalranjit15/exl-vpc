variable "region" {
  type        = string
  description = "Name of the AWS region to deploy VPC into"
  default     = "us-east-1"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
  default     = "example-vpc"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR address for the VPC"
  default     = "10.0.0.0/16"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnets to create within the VPC"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnets to create within the VPC"
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Whether or not to enable a NAT gateway for the private subnets"
  default     = true
}

variable "enable_vpn_gateway" {
  type        = bool
  description = "Whether or not to enable a VPN gateway"
  default     = false
}
