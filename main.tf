data "aws_ami" "amzn2" {
  most_recent = true

  owners = ["amazon"]

   filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amzn2.id
  instance_type = "t3.micro"

}
output "ami_id" {
  description = "AMI ID"
  value       = data.aws_ami.amzn2.id
}
