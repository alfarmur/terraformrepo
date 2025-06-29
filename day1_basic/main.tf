resource "aws_instance" "dev" {

  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = { name = "test"}
}

resource "aws_dynamodb_table" "dynamodb_terraform" {
  name = "terraform_state_lock"
  hash_key = "lock_id"
  read_capacity = 20
  write_capacity = 20
  attribute {
    name = "lock_id"
  }
}