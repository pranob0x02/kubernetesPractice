data "aws_ami" "ubuntuamiID" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "bastion_host" {
  ami           = data.aws_ami.ubuntuamiID.id
  instance_type = "t3.micro"
  key_name      = aws_key_pair.aws-key-terraform.key_name
  subnet_id     = module.vpc.public_subnets[0]

  tags = {
    Name = "BastionHost"
  }


}
