data "template_file" "example" {
  template = "$${hello} $${world}!"
  vars {
    hello = "goodnight"
    world = "moon"
  }
}


variable "count" {
  default = 3
}


resource "aws_instance" "bastion" {
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  ami = "ami-011b3ccf1bd6db744"
  instance_type = "t2.micro"
  key_name = "terraform_key"
  security_groups = ["allow_ssh"]
  root_block_device = { delete_on_termination = "True",  }

  tags {
    Name = "${format("bastion-%02d", count.index + 1)}"
  }

  provisioner "local-exec" {
    command = "sleep 60;ansible-playbook terraform.ansible.yml -u ec2-user -b --key-file=terraform_key.pem -e 'hostname=${format("bastion-%02d", count.index + 1)}' -i ${self.public_ip},"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo uptime",
    ]

  connection {
    user = "ec2-user"
    private_key = "${file("~/.ssh/terraform_key.pem")}"
    }
  } 

}


resource "aws_instance" "twmprod" {
  count = 1
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  subnet_id = "${aws_subnet.prdnet1_a.id}"
  ami = "ami-011b3ccf1bd6db744"
  instance_type = "t2.micro"
  key_name = "terraform_key" 
  ebs_block_device = [ { device_name = "/dev/xvdc", volume_size = "1", delete_on_termination = "True" }]
  vpc_security_group_ids = ["${aws_security_group.allow_ssh_vpc_prd_a.id}"]
  root_block_device = { delete_on_termination = "True",  } 

  tags {
    Name = "${format("twmprod-%02d", count.index + 1)}"
  }

}
