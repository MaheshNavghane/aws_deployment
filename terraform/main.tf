provider "aws" {
  region = "us-east-1"
}

resource "aws_lambda_function" "hello_world_lambda" {
  filename      = "lambda_function.zip"
  function_name = "hello-world-lambda"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "hello_world_lambda.lambda_handler"
  runtime       = "python3.8"
}

resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"
  
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
