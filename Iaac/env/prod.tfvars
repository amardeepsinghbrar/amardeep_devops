# ----------------------Common-----------------------
  profile = "default"
  dynamodynamodb_table = "terraform-lock"
  s3_terraform_state_store_bucket = "mys3bucket-terraform"
  environment = "prod"

# ----------------------VPC-----------------------
vpc_name                            = "amardeep_vpc"
vpc_cidr                            = "10.0.0.0/16"
az1                                 = "us-east-1a"
az2                                 = "us-east-1b"
cidr_public_subnet1                 = "10.0.1.0/24"
cidr_public_subnet2                 = "10.0.2.0/24"
cidr_private_subnet1                = "10.0.3.0/24"
cidr_private_subnet2                 = "10.0.4.0/24"
tags                                = {
                                        environment = "prod"
                                        techteam    = "devops"
                                        managedby   = "terraform"
                                      }

# ----------------------ECR-----------------------
ecr_name                            = "ecr-prod"
ecr_tag_mutability_setting          = "MUTABLE"
ecr_scan_on_push                    = false

# ----------------------AWS Code Pipeline---------
region                              = "us-east-1"
git_platform                        = "GITHUB"
git_repo_url                        = "https://github.com/amardeepsinghbrar/amardeep_assignment.git"
build_project_name                  = "amardeep_assignment"
build_project_description           = "To build node.js project"

# ----------------------EKS-----------------------
eks_cluster_name                    = "ecr-prod"
eks_cluster_version                 = "1.29"