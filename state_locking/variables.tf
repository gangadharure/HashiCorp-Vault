variable "tf_bucket-name" {
    default = "gvault-terraform-bucket"
    type = string
    description = "The s3 bucket name is of your state file storing"
}

variable "terraform-state_dynamo_table" {
 default = "vault-terraform-state-lock"
 type = string
 description = "The dynamodb table of your tfstate file"
 }

 variable "aws-region" {
   default = "us-east-2"
   type = string
   description = "The AWS region to deploy vault"
 }