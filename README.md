# AWS + Terraform

Amazon EC2 Instance installing MySQL on start using Terraform

## Description

This Terraform project creates an EC2 Instance using Amazon Linux 2 AMI and t2.micro instance type (free tier eligible), an Security Group with inbound rules to allow por 3306 from everywhere and attach it to EC2 Instace.

The file bootstrap.sh represents the EC2 user data to install MySQL Server.

## Installation

After download the repository, you need to install Terraform and AWS CLI. You also need to configure your own AWS credentials and use the profile "personal".

## Usage

```bash
terraform init
terraform apply
```
The resource will be created on your AWS console on us-east-1 region and the DNS from EC2 instance will be displayed as output on your console.