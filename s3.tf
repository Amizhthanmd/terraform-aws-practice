resource "aws_s3_bucket" "test-bucket1" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "Test Bucket"
    Environment = "Dev"
  }
}
