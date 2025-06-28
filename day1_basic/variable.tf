variable "ami_id" {
  type = string
  default = "ami-0d03cb826412c6b0f"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
  default = "newkey"
}