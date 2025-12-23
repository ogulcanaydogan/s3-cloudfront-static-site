variable "name" {
  description = "Base name used for resources."
  type        = string
}

variable "domain_name" {
  description = "Custom domain name for the CloudFront distribution (e.g., example.com)."
  type        = string
  default     = null
}

variable "hosted_zone_id" {
  description = "Route53 hosted zone ID for DNS validation and alias record."
  type        = string
  default     = null
}

variable "create_acm_cert" {
  description = "Whether to create an ACM certificate in us-east-1 for CloudFront."
  type        = bool
  default     = false
}

variable "acm_certificate_arn" {
  description = "Existing ACM certificate ARN to use with CloudFront (must be in us-east-1)."
  type        = string
  default     = null
}

variable "default_root_object" {
  description = "Default root object for CloudFront."
  type        = string
  default     = "index.html"
}

variable "price_class" {
  description = "CloudFront price class."
  type        = string
  default     = "PriceClass_100"
}

variable "tags" {
  description = "Tags applied to resources."
  type        = map(string)
  default     = {}
}

variable "invalidation_paths" {
  description = "Optional list of CloudFront invalidation paths."
  type        = list(string)
  default     = []
}
