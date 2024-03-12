locals {
  account_id = data.aws_caller_identity.current.account_id
}
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "code_pipeline_service_iam_role" {
  name               = "code_pipeline_service_iam_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "code_pipeline_service_policy_document" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "ec2:CreateNetworkInterface",
      "ec2:DescribeDhcpOptions",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DeleteNetworkInterface",
      "ec2:DescribeSubnets",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeVpcs",
    ]

    resources = ["*"]
  }
  statement {
    effect = "Allow"

    actions = [
        "ecr:BatchCheckLayerAvailability",
        "ecr:CompleteLayerUpload",
        "ecr:GetAuthorizationToken",
        "ecr:InitiateLayerUpload",
        "ecr:PutImage",
        "ecr:UploadLayerPart"
    ]

    resources = ["*"]
  }
  # statement {
  #   effect    = "Allow"
  #   actions   = ["ec2:CreateNetworkInterfacePermission"]
  #   resources = ["arn:aws:ec2:${var.region}:${local.account_id}:network-interface/*"]

  #   condition {
  #     test     = "StringEquals"
  #     variable = "ec2:Subnet"

  #     values = [
  #       aws_subnet.example1.arn,
  #       aws_subnet.example2.arn,
  #     ]
  #   }

  #   condition {
  #     test     = "StringEquals"
  #     variable = "ec2:AuthorizedService"
  #     values   = ["codebuild.amazonaws.com"]
  #   }
  # }
}

resource "aws_iam_role_policy" "code_pipeline_service_policy" {
  role   = aws_iam_role.code_pipeline_service_iam_role.name
  policy = data.aws_iam_policy_document.code_pipeline_service_policy_document.json
}

resource "aws_codebuild_project" "my_codebuild_project" {
  name          = var.build_project_name
  description   = var.build_project_description
  service_role = aws_iam_role.example.arn

  source {
    type = var.git_platform
    location = var.git_repo_url
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }
  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

    environment_variable {
      name  = "AWS_DEFAULT_REGION"
      value = var.region
    }
    environment_variable {
      name  = "AWS_ACCOUNT_ID"
      value = local.account_id
    }
    environment_variable {
      name  = "IMAGE_REPO_NAME"
      value = ""
    }
    environment_variable {
      name  = "IMAGE_TAG"
      value = ""
    }
  }
}
