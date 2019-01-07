# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
}

# Declare the data source
data "aws_availability_zones" "available" {}

# Configure the key pair to connect to the instances

resource "aws_key_pair" "terraform" {
  key_name   = "terraform_key"
  public_key = "${var.tfkeys["pubkey_prod"]}"
}

# Configure VPC

resource "aws_vpc" "vpc_prd_a" {
  cidr_block = "${var.vpc_prdnet_a}"
}

resource "aws_vpc" "vpc_prd_b" {
  cidr_block = "${var.vpc_prdnet_b}"
}

resource "aws_subnet" "prdnet1_a" {
  vpc_id = "${aws_vpc.vpc_prd_a.id}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  cidr_block = "${var.prdnet1_a}"
}

resource "aws_subnet" "prdnet2_a" {
  vpc_id = "${aws_vpc.vpc_prd_a.id}"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  cidr_block = "${var.prdnet2_a}"
}

resource "aws_subnet" "prdnet1_b" {
  vpc_id = "${aws_vpc.vpc_prd_b.id}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  cidr_block = "${var.prdnet1_b}"
}

resource "aws_subnet" "prdnet2_b" {
  vpc_id = "${aws_vpc.vpc_prd_b.id}"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  cidr_block = "${var.prdnet2_b}"
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

resource "aws_security_group" "allow_ssh_vpc_prd_a" {
  name        = "allow_ssh_vpc_prd_a"
  description = "Allow SSH traffic"
  vpc_id      = "${aws_vpc.vpc_prd_a.id}"

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


resource "aws_security_group" "allow_ssh_vpc_prd_b" {
  name        = "allow_ssh_vpc_prd_b"
  description = "Allow SSH traffic"
  vpc_id      = "${aws_vpc.vpc_prd_b.id}"

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
