variable "aws_region" {
  default = "us-east-2"
  description = "The AWS region to deploy resources"
}

variable "key_name" {
  default = "deployer_key"
  description = "The name of the key pair"
}

variable "instance_type" {
  default = "t2.micro"
  description = "The type of EC2 instance"
}

variable "instance_name" {
  default = "hashicorp_vault"
  description = "The name of the EC2 instance"
}
