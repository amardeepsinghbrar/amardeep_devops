terraform {
    backend "s3" {
        bucket                      = "mys3bucket-terraform"
        key                         = "prod/terraform.tfstate"
        dynamodb_table              = "terraform-lock"
        
        }

    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
  }

provider "aws" {
  region = "us-east-1"
  profile = "default"
}