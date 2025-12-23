provider "aws" {
  region = "us-west-2"
}

module "static_site" {
  source = "../.."

  name = "my-static-site"
}
