provider "aws" {
  region = "us-west-2"
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

module "static_site" {
  source = "../.."

  name            = "my-static-site"
  domain_name     = "example.com"
  hosted_zone_id  = "Z1234567890ABCDE"
  create_acm_cert = true

  providers = {
    aws          = aws
    aws.us_east_1 = aws.us_east_1
  }
}
