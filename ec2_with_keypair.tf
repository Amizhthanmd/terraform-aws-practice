resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "WebKeyPair" {
  key_name   = "WebKeyPair"
  public_key = tls_private_key.example.public_key_openssh
}

output "private_key" {
  value     = tls_private_key.example.private_key_pem
  sensitive = true
}

# resource "aws_key_pair" "MyKeyPair" {
#   key_name   = "MyKeyPair"
#   public_key = file("~/.keypairs/MyKeyPair.pub")
# }

resource "aws_instance" "web1" {
  ami                         = "ami-1e749f67"
  instance_type               = "t3.micro"
  subnet_id                   = "subnet-cb103460d01e286f6"
  key_name                    = aws_key_pair.WebKeyPair.key_name
  associate_public_ip_address = "true"

  tags = {
    Name = "localstack_web1"
  }
}
