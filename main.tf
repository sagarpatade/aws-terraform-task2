# main.tf

resource "aws_instance" "my_server" {
  ami           = "ami-04b70fa74e45c3917"  # Ubuntu 24.04 LTS ID
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-Automated-Instance"
  }
}