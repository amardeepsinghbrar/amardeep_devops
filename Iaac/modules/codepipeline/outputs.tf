output "code_build_iam_role_arn" {
  description = "Code build IAM role arn"
  value       = aws_iam_role.code_pipeline_service_iam_role.arn
}