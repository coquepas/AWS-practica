resource "aws_s3_bucket" "coque-simple-bucket" {

  tags = {
    Name        = "coque-simple-bucket"
    Environment = "Dev"
  }
}