provider "aws"{
alias = "ohio"
region = "us-east-2"
access_key = "AKIATAVAA3HGxxxxxxxx"
secret_key = "mWDCE19XIkhGbBxxxxxxxxxx/RUJ4ZLU1rg/DxT"
}

provider "aws"{
alias = "virginia"
region = "us-east-1"
access_key = "AKIATAVAA3HGxxxxxxxxx"
secret_key = "mWDCE19XIkhGbBxxxxxxxxx/RUJ4ZLU1rg/DxT"
}


resource "aws_instance" "ohio_instance"{
 provider = aws.ohio
 ami = "ami-0cb91c7de36xxxxx"
 instance_type = "t2.micro"
 tags={
  Name = "Primary_EC2"
  Role = "primary"
}
}
resource "aws_instance" "virginia_instance"{
 provider = aws.virginia
 ami = "ami-04b4f1a9cf5xxxxx"
 instance_type = "t2.micro"
 tags={
  Name = "Secondary_EC2"
  Role = "Backup"
}
}
