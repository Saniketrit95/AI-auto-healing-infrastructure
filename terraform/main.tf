provider "aws" {
  region = "us-east-1"
}

# Primary EC2 instance
resource "aws_instance" "primary" {
  ami           = "ami-0c02fb5595xxxxxx"  # Amazon Linux 2 (t2.micro free-tier)
  instance_type = "t2.micro"

  tags = {
    Name = "PrimaryEC2"
    Role = "Primary"
  }
}

# Secondary (Backup) EC2 instance
resource "aws_instance" "secondary" {
  ami           = "ami-04b4f1a9cxxxxxxxxx"
  instance_type = "t2.micro"

  tags = {
    Name = "SecondaryEC2"
    Role = "Backup"
  }
}
