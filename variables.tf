variable "aws_profile" {
  type    = string
  default = "default"
}

variable "aws_region" {
  type    = string
  default = "ap-southeast-1"
}

variable "vpc_id" {
  type = string
}

variable "ec2_instance_type" {
  type = string
  default = "t3.medium"
}