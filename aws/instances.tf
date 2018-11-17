resource "aws_ebs_volume" "web_vol1" {
  availability_zone = "us-west-1a"
  size = 1
  tags = { Name = "web_vol1" }
}

resource "aws_instance" "web" {
  ami = "ami-063aa838bd7631e0b"
  availability_zone = "us-west-1a"
  instance_type = "t2.micro"
  key_name = "terraform_key" 
  ebs_block_device = [ { device_name = "/dev/xvdc", volume_size = "1", delete_on_termination = "True" }]
  security_groups = ["allow_ssh"]
  root_block_device = { delete_on_termination = "True",  } 

  tags {
    Name = "web"
  }
}
