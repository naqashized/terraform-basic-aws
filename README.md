# EC2 instance running small app with SQS and S3 Resources
Please use below commands to create infrastructure using terraform;

## Initial Steps
AWS CLI shall already be setup and profile configure on your machine. I assume this is already configured on your machine.
Please create a new AWS Account and note down 12 digit Account ID. Add this account ID as Environment Variable on your machine so that terraform can use it in the code;

```shell script
export TF_VAR_aws_account_id=159012349963
```

Please create terraform-key.pm for your AWS account and put in under keys directory.

### Terraform commands
Please run these commands in sequence;

```shell script
terraform init
```

```shell script
terraform validate
```
```shell script
terraform plan
```
```shell script
terraform apply -auto-approve
```

Apply command will create EC2 instance, SQS and S3 resources in your AWS. You can confirm all these six resources in your AWS console.

You can access the app through public IP or DNS. It shall show you welcome page.

Once confirmed, please destroy your resources with be below command;

```shell script
terraform destroy -auto-approve
```

