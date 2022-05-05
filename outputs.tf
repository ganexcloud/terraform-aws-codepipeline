output "id" {
  description = "The codepipeline ID."
  value       = aws_codepipeline.this.id
}

output "arn" {
  description = "The codepipeline arn."
  value       = aws_codepipeline.this.arn
}

output "role_arn" {
  description = "ARN of the pipeline role"
  value       = local.role_arn
}

output "role_name" {
  description = "Name of the pipeline role created if var.role_arn is not supplied"
  value       = local.role_name
}

output "bucket_arn" {
  value       = aws_s3_bucket.this.arn
  description = "The ARN of the S3 Bucket project."
}

output "bucket_name" {
  value       = aws_s3_bucket.this.id
  description = "The ARN of the S3 Bucket project."
}
