# resource "aws_instance" "web1" {
#   ami                         = var.my_ami_id
#   instance_type               = var.ec2_type
#   subnet_id                   = "subnet-3f67a3f62b63b8c61"
#   key_name                    = "MyKeyPair"
#   associate_public_ip_address = "true"

#   tags = {
#     Name = "localstack_web1"
#   }
# }

# resource "aws_instance" "web2" {
#   ami                         = var.my_ami_id
#   instance_type               = var.ec2_type
#   subnet_id                   = "subnet-3f67a3f62b63b8c61"
#   key_name                    = "MyKeyPair"
#   associate_public_ip_address = "true"

#   tags = {
#     Name = "localstack_web3"
#   }
# }

# output "aws_instance.web1" {
#   value = aws_instance.web1.public_ip
# }
