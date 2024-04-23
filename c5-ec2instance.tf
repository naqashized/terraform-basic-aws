# Resource: EC2 Instance
resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  user_data = file("${path.module}/app1-install.sh")
  key_name = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "EC2 Demo"
  }
}

resource "aws_sqs_queue" "email" {
  name = var.email-queue
  visibility_timeout_seconds = 1500
  message_retention_seconds = 34500
  # redrive_policy = jsondecode({
  #   deadLetterTargetArn= aws_sqs_queue.email-dlq.arn
  #   maxReceiveCount=1
  # })
}

resource "aws_sqs_queue" "email-dlq" {
  name = "${var.email-queue}-dlq"
}

resource "aws_s3_bucket" "pictures-tah-dev" {
  bucket = "pictures-tah-dev"
}