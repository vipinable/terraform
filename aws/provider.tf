# Configure the AWS Provider
provider "aws" {
  region     = "us-west-1"
}

# Configure the key pair to connect to the instances

resource "aws_key_pair" "terraform" {
  key_name   = "terraform_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAsqGEs3sYjBOHHz+SKb4GOTltfPOy1bNOdfs+3KeVb9gTkOEXqEdxC2Q5QMaM1m9D5tF3526tusxUQAn6gpW6R5s67CWJtKLbUjIx4bduVMO8izU6f6aXsNjS29RtvKzRbeUpfXX5Q3xOTmpH+KUf6tEEA99+JWqDrVKmibEbgXxiEEDT4Y+HRVTD9pd/8mFWQChF6Zl3dqZm7/cVS6O/n9AklZyPcQEd+xjN7aIEVhNiwG0gC0J4B+pmBS0Zebld96TA65TmjLRwIMRtEI4Pz6/Ooc0o0Fh/UeMcBXdm0idlgmMpxD9cSIglBsBM4mMVjTH9rUp9I5UOkK7uJQOHyw== vnaray001c@res3parsr-ch2-01.sys.comcast.net"
}

# Configure security groups

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH traffic"

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
