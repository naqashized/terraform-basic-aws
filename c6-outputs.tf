# Terraform Output Values
output "instance_publicip" {
  description = "EC2 Instance Public IP"
  value = aws_instance.myec2vm.public_ip
}

output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  value = aws_instance.myec2vm.public_dns
}

output "sqs-email" {
  description = "Email SQS"
  value = aws_sqs_queue.email.name
}

output "aws_account_id" {
  description = "AWS Account ID"
  value = var.aws_account_id
}