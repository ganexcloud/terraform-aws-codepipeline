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

variable "create_notification_rule" {
  description = "(Required) Create CloudWatch Event Rule to automatically start pipeline when a change occurs."
  type        = bool
  default     = false
}

variable "notification_rule_event_type_ids" {
  type        = list(any)
  description = "(Required) A list of event types associated with this notification rule."
  default     = ["codepipeline-pipeline-pipeline-execution-failed", "codepipeline-pipeline-pipeline-execution-canceled", "codepipeline-pipeline-pipeline-execution-superseded"]
}

variable "notification_rule_target" {
  type        = list(any)
  description = "(Optional) Configuration blocks containing notification target information. Can be specified multiple times. At least one target must be specified on creation."
  default     = []
}

variable "webhook_enabled" {
  type        = bool
  description = "Set to false to prevent the module from creating any webhook resources"
  default     = false
}

variable "webhook_target_action" {
  type        = string
  description = "The name of the action in a pipeline you want to connect to the webhook. The action must be from the source (first) stage of the pipeline"
  default     = "Source"
}

variable "webhook_authentication" {
  type        = string
  description = "The type of authentication to use. One of IP, GITHUB_HMAC, or UNAUTHENTICATED"
  default     = "GITHUB_HMAC"
}

variable "webhook_filter_json_path" {
  type        = string
  description = "The JSON path to filter on"
  default     = "$.ref"
}

variable "webhook_filter_match_equals" {
  type        = string
  description = "The value to match on (e.g. refs/heads/{Branch})"
  default     = "refs/heads/{Branch}"
}