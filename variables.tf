variable "name" {
  type        = string
  description = "Name os resources"
}

variable "s3_bucket_name" {
  type        = string
  description = "S3 bucket name"
}

variable "role_arn" {
  type        = string
  description = "Optionally supply an existing role"
  default     = ""
}

variable "stages" {
  type        = list(any)
  description = "This list describes each stage of the build"
}

variable "tags" {
  type        = map(any)
  description = "Implements the common tags scheme"
  default     = {}
}
#
#variable "kms_key_arn" {
#  type    = string
#  default = null
#}

variable "create_cloudwatch_event_rule" {
  description = "(Required) Create CloudWatch Event Rule to automatically start pipeline when a change occurs."
  type        = bool
  default     = false
}

variable "cloudwatch_event_pattern" {
  description = "(Optional) Required if create_cloudwatch_event_rule = true. The event pattern described a JSON object."
  type        = string
  default     = null
}
