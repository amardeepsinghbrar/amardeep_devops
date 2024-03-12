
# module "my_vpc" {
#   # Creating VPC with 2 public and 2 private subnets. 
#   source                             = "./modules/vpc"
#   vpc_name                           = var.vpc_name
#   vpc_cidr                           = var.vpc_cidr
#   az1                                = var.az1
#   az2                                = var.az2
#   cidr_public_subnet1                = var.cidr_public_subnet1
#   cidr_public_subnet2                = var.cidr_public_subnet2
#   cidr_private_subnet1               = var.cidr_private_subnet1
#   cidr_private_subnet2               = var.cidr_private_subnet2
#   tags                               = var.tags

#   profile                            = var.profile
#   dynamodynamodb_table               = var.dynamodynamodb_table
#   s3_terraform_state_store_bucket    = var.s3_terraform_state_store_bucket
#   environment                        = var.environment
#   region                             = var.region
# }

module "my_ecr" {
  # Creating a ECR
  source                      = "./modules/ecr"
  ecr_name                    = var.ecr_name
  ecr_tag_mutability_setting  = var.ecr_tag_mutability_setting
  ecr_scan_on_push            = var.ecr_scan_on_push
  tags                        = var.tags

  profile                            = var.profile
  dynamodynamodb_table               = var.dynamodynamodb_table
  s3_terraform_state_store_bucket    = var.s3_terraform_state_store_bucket
  environment                        = var.environment
  region                             = var.region
}

module "my_codepipeline" {
  # Creating a ECR
  source                            = "./modules/codepipeline"
  git_platform                      = var.git_platform  
  git_repo_url                      = var.git_repo_url
  build_project_name                = var.build_project_name
  build_project_description         = var.build_project_description

  profile                            = var.profile
  dynamodynamodb_table               = var.dynamodynamodb_table
  s3_terraform_state_store_bucket    = var.s3_terraform_state_store_bucket
  environment                        = var.environment
  region                             = var.region


}
