module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  # Pass required variables to the VPC module
}

# EC2 instance resource
resource "aws_instance" "vault" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = module.vpc.public_subnets.subnet_id  # Use the first public subnet
  vpc_security_group_ids = module.vpc.default_vpc_id

  user_data = file("./vault_user_data.sh")  # Path to your user data script

  tags = {
    Name = var.instance_name
  }
}

