# data "terraform_remote_state" "remote_network"{
#     backend = "s3"
#     config = {
#       bucket    = var.s3_terraform_state_store_bucket
#       key       = "${var.environment}/terraform.tfstate"
#       region    = var.region
#       profile   = var.profile
#     }
# }

data "aws_caller_identity" "current" {}