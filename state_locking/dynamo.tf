resource "aws_dynamodb_table" "terraform-lock" {
    name = var.terraform-state_dynamo_table
    read_capacity = 5
    write_capacity = 5
    hash_key = "LockID"
    attribute {
      name = "LockID"
      type = "S"
    }
  tags = {
    "Name" = "DynamoDb terraform state lock table"
  }
}