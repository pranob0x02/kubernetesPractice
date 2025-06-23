terraform {
  backend "s3" {
    bucket = "gitopspranob"
    key    = "terraform/state"
    region = "us-east-1"

  }
}
