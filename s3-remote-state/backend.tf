terraform {
  backend "s3" {
    bucket       = "ishika-tf-state-794131639"
    key          = "learn-terraform/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}
