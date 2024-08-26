# Terraform Project

This repository contains Terraform configurations for setting up various infrastructure components such as state locking, VPC, and EC2 instances.

## Directory Structure

terraform/ ├── state_locking/ │ ├── dynamodb.tf │ ├── providers.tf │ ├── s3.tf │ └── variables.tf │ ├── vpc/ │ ├── main.tf │ ├── outputs.tf │ ├── providers.tf │ ├── security_groups.tf │ ├── subnets.tf │ ├── variables.tf │ └── vpc.tf │ └── ec2/ ├── backend.tf ├── main.tf ├── outputs.tf ├── providers.tf ├── variables.tf


## Usage

- Navigate to the respective directory to apply Terraform configurations.
- Use `terraform init` to initialize the project.
- Use `terraform plan` to see the execution plan.
- Use `terraform apply` to apply the changes.

## Requirements

- Terraform >= 0.12
- AWS Account
