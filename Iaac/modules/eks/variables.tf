variable "vpc_id" {
    type = string
    description = "vpc_id"
}
variable "vpc_cidr_block" {
    type = string
    description = "vpc_cidr_block"    
}
variable "eks_cluster_name" {
    type = string
    description = "eks_cluster_name"
}
variable "eks_cluster_version" {
    type = string
    description = "eks_cluster_version"
}
variable "cidr_private_subnet1" {
    type = string
    description = "cidr_public_subnet1"
}
variable "cidr_private_subnet2" {
    type = string
    description = "cidr_public_subnet2"
}
variable "tags" {
    type = map(string)
    description = "tags"
}