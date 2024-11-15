terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.75" # Use this to allow patch updates for version 5.75.x
    }
  }
}

provider "aws" {
  access_key = "${var.AWS_ACCESS_KEY}"        # Removed braces around variable names
  secret_key = "${var.AWS_SECRET_KEY}"
  token      = "${var.AWS_SESSION_TOKEN}"
  region     = "us-east-2"
}

