resource "aws_ecr_repository" "frontend-app" {
  name = "megazone-frontend"
  force_delete = true
  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}

resource "aws_ecr_repository" "backend-app" {
  name = "megazone-backend"
  force_delete = true
  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}

resource "aws_ecr_repository" "nginx" {
  name = "nginx"
  force_delete = true
  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}

resource "aws_ecr_repository" "php-fpm" {
  name = "php-fpm"
  force_delete = true
  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}