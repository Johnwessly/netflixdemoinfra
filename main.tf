provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 5
  ami                    = "ami-0360c520857e3138f"
  instance_type          = "t2.medium"
  key_name               = "devops"
  vpc_security_group_ids = ["sg-0747c5f0749fb0284"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "nexus", "tomcat-1", "tomcat-2", "Monitoring server"]
}
