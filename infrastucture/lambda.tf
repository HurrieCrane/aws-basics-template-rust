data "archive_file" "lambda_1_zip" {
  type        = "zip"
  output_path = "lambda_1.zip"

  source_dir = "../target/lambda/lambda-1"
}

resource "aws_lambda_function" "lambda_1" {
  function_name = "lambda_1"
  description   = "Example to show how to create Lambda that supports Rust runtime"

  handler  = "bootstrap"
  runtime  = "provided.al2"
  filename = data.archive_file.lambda_1_zip.output_path
  architectures = [
    "arm64"
  ]

  source_code_hash = data.archive_file.lambda_1_zip.output_base64sha256
  tags = local.tags
}