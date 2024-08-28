output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
    value = module.vpc.public_subnets 
}

output "private_subnet" {
  value = module.vpc.private_subnets
}

# modules/vpc/outputs.tf
output "vpc_security_group_ids" {
  value = aws_security_group.vault_sg.*.id
}
