<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.63 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.63 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_codepipeline.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codepipeline) | resource |
| [aws_codestarnotifications_notification_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codestarnotifications_notification_rule) | resource |
| [aws_iam_role.cloudwatch_event](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.pipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.inline_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_notification.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification) | resource |
| [aws_iam_policy_document.pipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudwatch_event_pattern"></a> [cloudwatch\_event\_pattern](#input\_cloudwatch\_event\_pattern) | (Optional) Required if create\_cloudwatch\_event\_rule = true. The event pattern described a JSON object. | `string` | `null` | no |
| <a name="input_create_cloudwatch_event_rule"></a> [create\_cloudwatch\_event\_rule](#input\_create\_cloudwatch\_event\_rule) | (Required) Create CloudWatch Event Rule to automatically start pipeline when a change occurs. | `bool` | `false` | no |
| <a name="input_create_notification_rule"></a> [create\_notification\_rule](#input\_create\_notification\_rule) | (Required) Create CloudWatch Event Rule to automatically start pipeline when a change occurs. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name os resources | `string` | n/a | yes |
| <a name="input_notification_rule_event_type_ids"></a> [notification\_rule\_event\_type\_ids](#input\_notification\_rule\_event\_type\_ids) | (Required) A list of event types associated with this notification rule. | `list(any)` | <pre>[<br>  "codepipeline-pipeline-pipeline-execution-failed",<br>  "codepipeline-pipeline-pipeline-execution-canceled",<br>  "codepipeline-pipeline-pipeline-execution-superseded"<br>]</pre> | no |
| <a name="input_notification_rule_target"></a> [notification\_rule\_target](#input\_notification\_rule\_target) | (Optional) Configuration blocks containing notification target information. Can be specified multiple times. At least one target must be specified on creation. | `list(any)` | `[]` | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | Optionally supply an existing role | `string` | `""` | no |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | S3 bucket name | `string` | n/a | yes |
| <a name="input_stages"></a> [stages](#input\_stages) | This list describes each stage of the build | `list(any)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Implements the common tags scheme | `map(any)` | `{}` | no |

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
<!-- END_TF_DOCS -->