variable "network_name" {
  default     = "hashicorp-network"
  description = "The name of the network"
}

variable "aws-region" {
  default     = "us-east-2"
  type        = string
  description = "The AWS region to deploy vault"
}
 
variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "The CIDR block for VPC"
}

variable "availability_zones" {
  default     = ["us-east-2a", "us-east-2b"]
  description = "The availability zone for subnets"
}

variable "private_subnet" {
  default     = ["10.0.1.0/24"]
  description = "The CIDR blocks for the private subnets"
}

variable "public_subnet" {
  default     = ["10.0.101.0/24"]
  description = "The CIDR blocks for the public subnets"
}

variable "enable_nat_gateway" {
  default     = true
  description = "Enable NAT gateway"
}
