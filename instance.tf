data "aws_ami" "awsdevbox" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["099720109477"] # Canonical official
}

resource "aws_instance" "awsdevbox" {
  ami           = data.aws_ami.awsdevbox.id
  instance_type = var.ec2_instance_type

  root_block_device {
    volume_size = 20
  }

  // lifecycle {
  //   create_before_destroy = true
  // }

  key_name = aws_key_pair.kp.key_name

  vpc_security_group_ids = [
    aws_security_group.awsdevbox.id
  ]

  provisioner "remote-exec" {
    inline = ["sudo apt update && sudo apt install python3 -y"]

    connection {
      host  = self.public_ip
      type  = "ssh"
      user  = "ubuntu"
      agent = "true"
    }
  }

  // provisioner "local-exec" {
  //   command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu -i '${self.public_ip},'  server-provisioning.yml"
  // }

  tags = {
    Name = "development-server"
  }
}