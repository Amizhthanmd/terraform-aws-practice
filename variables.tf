variable "ec2_type" {
  default = "t3.micro"
  type    = string
}

variable "my_ami_id" {
  type    = string
  default = "ami-1e749f67"
}
