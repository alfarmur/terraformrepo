 terraform {
   backend "s3" {
 bucket = "irumporaiamma"
 key    = "terraform.tfstate"
 region = "ap-south-1"
 dynamodb_table = "terraform_state_lock_dynamo"
 encrypt = true
   }
 }
