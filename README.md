# ☁️ Day 2 Task: AWS & Terraform Basics

## 📌 Objective
To understand AWS core concepts and demonstrate Infrastructure as Code (IaC) by provisioning an EC2 instance manually and via Terraform.

## 🛠️ Tech Stack
- **Cloud Provider:** AWS (Amazon Web Services)
- **Tool:** Terraform (Infrastructure as Code)
- **Service:** EC2 (Elastic Compute Cloud)

## 📝 Part 1: Manual EC2 Launch
I manually launched an instance using the AWS Console to understand the parameters required.
1. **AMI:** Ubuntu 24.04 LTS
2. **Instance Type:** t2.micro (Free Tier)
3. **Key Pair:** Created `my-key.pem` for SSH access.
4. **Result:** Instance launched successfully.

## 🤖 Part 2: Terraform Provisioning
I automated the process using a `main.tf` configuration file.

### Steps Taken:
1. **Setup:** Installed Terraform and configured credentials using `aws configure`.
2. **Code:** Defined the `aws_instance` resource specifying the AMI and Instance Type.
3. **Execution:**
   - `terraform init`: Initialized the working directory.
   - `terraform plan`: Previewed the infrastructure changes.
   - `terraform apply`: Provisioned the EC2 instance.
   - `terraform destroy`: Cleaned up resources.

### 📄 Configuration (`main.tf`)
```hcl
resource "aws_instance" "my_server" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform-Automated-Instance"
  }
}