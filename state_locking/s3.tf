resource "aws_s3_bucket" "tf_state" {
  bucket = "vault-terraform-bucket"
  
  # Other configurations (e.g., server-side encryption, versioning) can remain here...
  
  # Tags for the S3 bucket
  tags = {
    Name        = "S3 Remote terraform state store"
    Environment = "dev"
    Project     = "HashiCorp Vault"
  }
}

# Separate resource to define the ACL for the bucket
resource "aws_s3_bucket_acl" "tf_state_acl" {
  bucket = aws_s3_bucket.tf_state.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "tf_state_versioning" {
  bucket = aws_s3_bucket.tf_state.bucket

  versioning_configuration {
    status = "Enabled"
  }
}
