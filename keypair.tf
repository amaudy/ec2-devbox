resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "devboxkeypair"
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" { # Create a "devboxkeypair.pem" to your computer!!
    command = <<-EOT
      echo '${tls_private_key.pk.private_key_pem}' > ./devboxkeypair.pem
      chmod 0400 ./devboxkeypair.pem
      ssh-add ./devboxkeypair.pem
    EOT
  }
}