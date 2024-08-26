module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  name    = "${var.network_name}-vpc"
  cidr    = var.vpc_cidr

  azs              = var.availability_zones
  private_subnets  = var.private_subnet
  public_subnets   = var.public_subnet
  enable_nat_gateway = var.enable_nat_gateway

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.network_name}-vpc"
  }

  public_subnet_tags = {
    Name = "${var.network_name}-public"
  }

  private_subnet_tags = {
    Name = "${var.network_name}-private"
  }
}

resource "aws_security_group" "vault_sg" {
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Vault Security Group"
  }
}
