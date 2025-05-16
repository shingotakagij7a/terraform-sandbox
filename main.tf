provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true

  s3_use_path_style = true

  endpoints {
    s3 = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "localstack_s3" {
  bucket = "localstack-s3"
}

resource "aws_s3_bucket_acl" "localstack_s3_acl" {
  bucket = aws_s3_bucket.localstack_s3.id

  acl = "public-read"
}
