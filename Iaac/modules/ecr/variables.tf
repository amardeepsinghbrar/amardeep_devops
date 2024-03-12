variable "ecr_name" {
    type = string
    description = "Name of ECR"
}
variable "ecr_tag_mutability_setting" {
    type = string
    description = "The tag mutability setting for the repository"
}
variable "ecr_scan_on_push" {
    type = bool
    default = false
    description = "The tag mutability setting for the repository"
}
variable "tags" {
    type = map(string)
    description = "tags"
}
variable "region" {
    type = string
    description = "region"
}

variable "profile" {
    type = string
    description = "profile"
}
variable "dynamodynamodb_table" {
    type = string
    description = "dynamodynamodb_table"
}
variable "s3_terraform_state_store_bucket" {
    type = string
    description = "s3_terraform_state_store_bucket"
}
variable "environment" {
    type = string
    description = "environment"
}