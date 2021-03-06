module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zones.available.names
  private_subnets = var.private_subnets

  enable_nat_gateway = var.enable_nat_gateway
  enable_vpn_gateway = var.enable_vpn_gateway

}

resource "aws_default_security_group" "default" {
  vpc_id = module.vpc.vpc_id

  # ingress {
  #   from_port = 0
  #   to_port   = 0
  #   protocol  = -1
  #   self      = true
  # }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = var.routing_table_cidr
    gateway_id = aws_internet_gateway.example.id
  }
  
#  module "tgw" {
#  source  = "terraform-aws-modules/transit-gateway/aws"
#  version = "~> 2.0"

#  name        = "my-tgw"
#  description = "My TGW shared with several other AWS accounts"

#  enable_auto_accept_shared_attachments = true

#  vpc_attachments = {
#    vpc = {
#      vpc_id       = module.vpc.vpc_id
#      subnet_ids   = module.vpc.private_subnets
#      dns_support  = false
#      ipv6_support = false

#      ttgw_routes = [
#        {
#          destination_cidr_block = "30.0.0.0/16"
#        },
#      ]
#    }
#  }
#  tags = {
#    Purpose = "tgw-complete-example"
#  }
#}
