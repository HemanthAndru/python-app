provider "aws" {
  region  = "us-east-2"
  version = ">=3.7, <=3.11"
}

variable "zones" {
  default = ["us-east-2a", "us-east-2b"]
}



resource "aws_instance" "MyPyApp" {
  ami           = "ami-0dd0ccab7e2801812"
  count         = 2
  instance_type = "t2.micro"
  availability_zone = var.zones[count.index]
  tags = {
    Name = "Mypyapp-${count.index +1}"
  }
}

  
