## Compatibility

This module requires Terraform 0.13.1 or later. Older Terraform versions are not supported.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.63 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.58.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.9.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_codepipeline.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codepipeline) | resource |
| [aws_codepipeline_webhook.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codepipeline_webhook) | resource |
| [aws_codestarnotifications_notification_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codestarnotifications_notification_rule) | resource |
| [aws_iam_role.cloudwatch_event](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.pipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.inline_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_notification.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification) | resource |
| [random_string.webhook_secret](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [aws_iam_policy_document.pipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudwatch_event_pattern"></a> [cloudwatch\_event\_pattern](#input\_cloudwatch\_event\_pattern) | (Optional) Required if create\_cloudwatch\_event\_rule = true. The event pattern described a JSON object. | `string` | `null` | no |
| <a name="input_create_cloudwatch_event_rule"></a> [create\_cloudwatch\_event\_rule](#input\_create\_cloudwatch\_event\_rule) | (Required) Create CloudWatch Event Rule to automatically start pipeline when a change occurs. | `bool` | `false` | no |
| <a name="input_create_notification_rule"></a> [create\_notification\_rule](#input\_create\_notification\_rule) | (Required) Create CloudWatch Event Rule to automatically start pipeline when a change occurs. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Name os resources | `string` | n/a | yes |
| <a name="input_notification_rule_event_type_ids"></a> [notification\_rule\_event\_type\_ids](#input\_notification\_rule\_event\_type\_ids) | (Required) A list of event types associated with this notification rule. | `list(any)` | <pre>[<br/>  "codepipeline-pipeline-pipeline-execution-failed",<br/>  "codepipeline-pipeline-pipeline-execution-canceled",<br/>  "codepipeline-pipeline-pipeline-execution-superseded"<br/>]</pre> | no |
| <a name="input_notification_rule_target"></a> [notification\_rule\_target](#input\_notification\_rule\_target) | (Optional) Configuration blocks containing notification target information. Can be specified multiple times. At least one target must be specified on creation. | `list(any)` | `[]` | no |
| <a name="input_pipeline_type"></a> [pipeline\_type](#input\_pipeline\_type) | (Optional) Type of the pipeline. Possible values are: V1 and V2. Default value is V1. | `string` | `"V2"` | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | (Optional) Supply an existing role | `string` | `""` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | (Optional) Custom role name | `string` | `""` | no |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | (Required) S3 bucket name | `string` | n/a | yes |
| <a name="input_stages"></a> [stages](#input\_stages) | (Required) This list describes each stage of the build | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Implements the common tags scheme | `map(any)` | `{}` | no |
| <a name="input_webhook_authentication"></a> [webhook\_authentication](#input\_webhook\_authentication) | (Optional) The type of authentication to use. One of IP, GITHUB\_HMAC, or UNAUTHENTICATED | `string` | `"GITHUB_HMAC"` | no |
| <a name="input_webhook_enabled"></a> [webhook\_enabled](#input\_webhook\_enabled) | (Required) Set to false to prevent the module from creating any webhook resources | `bool` | `false` | no |
| <a name="input_webhook_filter_json_path"></a> [webhook\_filter\_json\_path](#input\_webhook\_filter\_json\_path) | (Optional) The JSON path to filter on | `string` | `"$.ref"` | no |
| <a name="input_webhook_filter_match_equals"></a> [webhook\_filter\_match\_equals](#input\_webhook\_filter\_match\_equals) | (Optional) The value to match on (e.g. refs/heads/{Branch}) | `string` | `"refs/heads/{Branch}"` | no |
| <a name="input_webhook_target_action"></a> [webhook\_target\_action](#input\_webhook\_target\_action) | (Optional) The name of the action in a pipeline you want to connect to the webhook. The action must be from the source (first) stage of the pipeline | `string` | `"Source"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The codepipeline arn. |
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | The ARN of the S3 Bucket project. |
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | The ARN of the S3 Bucket project. |
| <a name="output_cloudwatch_event_role_arn"></a> [cloudwatch\_event\_role\_arn](#output\_cloudwatch\_event\_role\_arn) | ARN of the CloudWatch Event role created if var.create\_cloudwatch\_event\_rule is true |
| <a name="output_cloudwatch_event_role_name"></a> [cloudwatch\_event\_role\_name](#output\_cloudwatch\_event\_role\_name) | Name of the CloudWatch Event role created if var.create\_cloudwatch\_event\_rule is true |
| <a name="output_id"></a> [id](#output\_id) | The codepipeline ID. |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | ARN of the pipeline role |
| <a name="output_role_name"></a> [role\_name](#output\_role\_name) | Name of the pipeline role created if var.role\_arn is not supplied |
| <a name="output_webhook_secret"></a> [webhook\_secret](#output\_webhook\_secret) | Name of the CloudWatch Event role created if var.create\_cloudwatch\_event\_rule is true |
| <a name="output_webhook_url"></a> [webhook\_url](#output\_webhook\_url) | Name of the CloudWatch Event role created if var.create\_cloudwatch\_event\_rule is true |
<!-- END_TF_DOCS -->
