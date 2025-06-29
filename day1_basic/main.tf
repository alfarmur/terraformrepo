resource "aws_instance" "dev" {

  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

}

# resource "aws_dynamodb_table" "dynamodb_terraform" {
#   name = "terraform_state_lock_dynamo"
#   hash_key = "LockID"
#   read_capacity = 20
#   write_capacity = 20
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }