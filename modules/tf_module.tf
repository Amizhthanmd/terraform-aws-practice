provider "aws" {
  region = "us-east-1"
}

module "vpc1" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc1"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-1a", "us-west-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_security_group" "sg1" {
  name = "sg1"
  #   description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id = module.vpc1.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["192.168.56.4/32"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "sg1"
    Terraform = "true"
  }
}

resource "aws_instance" "web1" {
  ami                         = "ami-1e749f67"
  instance_type               = "t3.micro"
  subnet_id                   = module.vpc1.public_subnets[0]
  key_name                    = "MyKeyPair"
  associate_public_ip_address = "true"
  security_groups             = [aws_security_group.sg1.id]

  tags = {
    Name = "localstack_web1"
  }
}
