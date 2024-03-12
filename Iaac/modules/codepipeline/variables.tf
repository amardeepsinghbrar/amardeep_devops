variable "git_platform" {
    type            = string
    default         = "GITHUB"
    description     = "git_platform"
}
variable "git_repo_url" {
    type            = string
    description     = "git url"
}
variable "build_project_name" {
    type            = string
    description     = "build_project_name"
}
variable "build_project_description" {
    type            = string
    description     = "build_project_description"
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