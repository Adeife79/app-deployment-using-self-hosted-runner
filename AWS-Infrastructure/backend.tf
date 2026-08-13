terraform {
    backend "s3" {
        bucket = "app-demo-tf-state"
        key    = "terraform.tfstate"
        region = "eu-north-1"
    }
}