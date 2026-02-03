# 1. Created an AWS Key Pair
resource "aws_key_pair" "deployer" {
  key_name   = "sagar-new-key"
  public_key = file("my-key.pub")
}

# 2. Used the default VPC
resource aws_default_vpc default {
  
}

# 2. Created a Security Group to allow SSH (Port 22)

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 3. EC2 Instance
resource "aws_instance" "my_ec2" {
  ami           = "ami-0b6c6ebed2801a5cb" # Amazon Linux 2 AMI in us-east-1
  instance_type = "t2.micro"

  # attached the key pair
  key_name = aws_key_pair.deployer.key_name

  # attached the security group 
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "Terraform-Instance"
  }
}