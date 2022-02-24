# Using EC2 instance as development environment

Launch EC2 instance for development and destroy when you need.

## What?

The Terraform script in this repository.

- Will create AWS keypair
- Will create EC2 instance
- Will create new security group and allow only you (IP) to access this machine

## Why?

Need EC2 instance for development purpose.

## How?

Make sure you have permission to create EC2 instance

Init Terraform

```
terraform init
```

Then create instance with

```
terraform apply --auto-approve
```

After successfully create the script will return IP of your server

### Destroy resources

When you done the things and want to remove servers, security group and keypair.

Run following command

```
terraform destroy --auto-approve
```
