# s3-cloudfront-static-site

Terraform module to provision a secure static site backed by a private S3 bucket and CloudFront with Origin Access Control (OAC). Optional Route53 alias records and ACM certificate creation (DNS validation) are supported for custom domains.

## Features

- Private S3 bucket with public access blocked
- CloudFront distribution with OAC
- Bucket policy allowing access from CloudFront only
- Optional Route53 alias records
- Optional ACM certificate (DNS validation)
- Optional CloudFront invalidation paths

## Usage

### Minimal (no custom domain)

```hcl
module "static_site" {
  source = "../.."

  name = "my-static-site"
}
```

### Custom domain with ACM and Route53

> **Note:** CloudFront requires ACM certificates in **us-east-1**. Use a provider alias for ACM resources.

```hcl
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
```

## Inputs

| Name | Type | Default | Description |
|------|------|---------|-------------|
| name | string | n/a | Base name used for resources. |
| domain_name | string | null | Custom domain name for the CloudFront distribution. |
| hosted_zone_id | string | null | Route53 hosted zone ID for DNS validation and alias record. |
| create_acm_cert | bool | false | Whether to create an ACM certificate in us-east-1. |
| acm_certificate_arn | string | null | Existing ACM certificate ARN to use with CloudFront. |
| default_root_object | string | "index.html" | Default root object for CloudFront. |
| price_class | string | "PriceClass_100" | CloudFront price class. |
| tags | map(string) | {} | Tags applied to resources. |
| invalidation_paths | list(string) | [] | Optional list of CloudFront invalidation paths. |

## Outputs

| Name | Description |
|------|-------------|
| bucket_name | Name of the S3 bucket. |
| cloudfront_domain_name | CloudFront distribution domain name. |
| distribution_id | CloudFront distribution ID. |
| website_url | Custom domain URL when configured. |
| certificate_arn | ACM certificate ARN used by CloudFront (if any). |

## Examples

See [examples/minimal](examples/minimal) and [examples/custom_domain](examples/custom_domain).
