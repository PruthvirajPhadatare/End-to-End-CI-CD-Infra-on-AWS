resource "aws_cloudwatch_log_group" "logs" {
  name              = "/ecs/cicd-app"
  retention_in_days = 7
}
