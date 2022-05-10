provider "aws" {
  region = "us-east-1"
}

module "codepipeline_notifications" {
  source               = "ganexcloud/codepipeline-notifications/aws"
  version              = "1.0.0"
  lambda_function_name = "codepipeline_notifications"
  sns_topic_name       = "codepipeline_notifications"
  webhook_url          = "https://api.squadcast.com/v2/incidents/api/xxxxxxxxxxxxxxxxxxxx"
  messenger            = "squadcast"
}


module "codebuild" {
  source  = "ganexcloud/codebuild/aws"
  version = "1.0.0"
  name    = "pipeline"
  codebuild_source = {
    type = "CODEPIPELINE"
  }
  codebuild_source_s3_bucket_name = module.codepipeline.bucket_name
  environment = {
    compute_type    = "BUILD_GENERAL1_SMALL"
    privileged_mode = true
    variables = [
      {
        name  = "AWS_REGION"
        value = "us-east-1"
      },
      {
        name  = "AWS_ACCOUNT_ID"
        value = "xxxxxxx"
      },
      {
        name  = "ECR_REPO_NAME"
        value = "frontend"
      },
      {
        name  = "DOCKER_IMAGE"
        value = "api"
      },
      {
        name  = "APP_ENV_FILE"
        value = "appsettings.Homolog.json"
      },
    ]
  }
}

module "codepipeline" {
  source                       = "../../"
  name                         = "pipeline"
  s3_bucket_name               = "codepipeline-pipeline"
  create_cloudwatch_event_rule = true
  cloudwatch_event_pattern     = <<EOF
{
  "source": ["aws.s3"],
  "detail-type": ["AWS API Call via CloudTrail"],
  "detail": {
    "eventSource": ["s3.amazonaws.com"],
    "eventName": ["PutObject", "CompleteMultipartUpload", "CopyObject"],
    "requestParameters": {
      "bucketName": ["codepipeline-pipeline"],
      "key": ["source.zip"]
    }
  }
}
EOF
  stages = [
    {
      name = "Source"
      action = [{
        name     = "Source"
        category = "Source"
        owner    = "AWS"
        provider = "S3"
        version  = "1"
        configuration = {
          "S3Bucket"           = "codepipeline-pipeline"
          "S3ObjectKey"        = "source.zip"
          PollForSourceChanges = false
        }
        input_artifacts  = []
        output_artifacts = ["SourceArtifact"]
        run_order        = 1
      }]
    },
    {
      name = "Build"
      action = [{
        name             = "Build"
        category         = "Build"
        owner            = "AWS"
        provider         = "CodeBuild"
        input_artifacts  = ["SourceArtifact"]
        output_artifacts = ["BuildArtifact"]
        version          = "1"
        run_order        = 2
        configuration = {
          ProjectName = module.codebuild.name
        }
      }]
    }
  ]
  create_notification_rule = true
  notification_rule_target = [
    {
      address = module.codepipeline_notifications.sns_topic_arn
    }
  ]
}
