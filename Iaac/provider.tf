terraform {
    backend "s3" {
        bucket                      = "mys3bucket-terraform"
        key                         = "prod/terraform.tfstate"
        dynamodb_table              = "terraform-lock"
        region = "us-east-1"   
        }

    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
        helm = {
          source  = "hashicorp/helm"
          version = ">= 2.7"
        }
        kubectl = {
          source  = "alekc/kubectl"
          version = ">= 2.0"
        }
    }
  }

provider "aws" {
  profile = "default"
}