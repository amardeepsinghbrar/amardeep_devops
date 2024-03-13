data "aws_eks_cluster" "cluster" {
  name = var.eks_cluster_name
}
data "aws_eks_cluster_auth" "cluster" {
  name = var.eks_cluster_name
}
data "aws_iam_openid_connect_provider" "oidc_provider" {
  url = data.aws_eks_cluster.cluster.identity.0.oidc.0.issuer
}