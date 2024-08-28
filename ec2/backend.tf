terraform {
  backend "s3" {
    bucket         = "gvault-terraform-bucket"   # Replace with your actual S3 bucket name
    key            = "vpc/terraform.tfstate"    # Path in the S3 bucket for the state file
    region         = "us-east-2"                # Replace with the correct AWS region where your bucket is located
    dynamodb_table = "vault-terraform-state-lock"  # Replace with your DynamoDB table name
  }
}
