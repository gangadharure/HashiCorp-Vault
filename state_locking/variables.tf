variable "tf_bucket-name" {
    default = "vault-terraform-bucket"
    type = string
    description = "The s3 bucket name is of your state file storing"
}

variable "terraform-state_dynamo_table" {
 default = "vault-terraform-state-lock"
 type = string
 description = "The dynamodb table of your tfstate file"
 }

 variable "aws-region" {
   default = "us-east-1"
   type = string
   description = "The AWS region to deploy vault"
 }