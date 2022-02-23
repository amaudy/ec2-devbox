output "server_ip" {
  value       = aws_instance.awsdevbox.public_ip
  description = "IP to server"
}

output "private_key" {
  value       = tls_private_key.pk.private_key_pem
  description = "Private key to access the EC2 instances"
  sensitive   = true
}