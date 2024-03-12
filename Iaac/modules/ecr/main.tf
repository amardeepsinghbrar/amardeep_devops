resource "aws_ecr_repository" "foo" {
  name                 = var.ecr_name
  image_tag_mutability = var.ecr_tag_mutability_setting

  image_scanning_configuration {
    scan_on_push = var.ecr_scan_on_push
  }
  tags = var.tags
}