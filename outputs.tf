output "bucket_name" {
  description = "Name of the S3 bucket."
  value       = aws_s3_bucket.this.id
}

output "cloudfront_domain_name" {
  description = "CloudFront distribution domain name."
  value       = aws_cloudfront_distribution.this.domain_name
}

output "distribution_id" {
  description = "CloudFront distribution ID."
  value       = aws_cloudfront_distribution.this.id
}

output "website_url" {
  description = "Custom domain URL when configured."
  value       = local.use_custom_domain ? "https://${var.domain_name}" : null
}

output "certificate_arn" {
  description = "ACM certificate ARN used by CloudFront (if any)."
  value       = local.certificate_arn
}
