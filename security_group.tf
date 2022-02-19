resource "aws_security_group" "awsdevbox" {
  name        = "awsdevbox"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "AWS Devbox"
  }
}

resource "aws_security_group_rule" "awsdevbox_out" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.awsdevbox.id
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

resource "aws_security_group_rule" "all_only_me" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["${chomp(data.http.myip.body)}/32"]
  security_group_id = aws_security_group.awsdevbox.id
}

// Remove the comment if you want to open 80 to public
// resource "aws_security_group_rule" "awsdevbox_in_http" {
//   type              = "ingress"
//   from_port         = 80
//   to_port           = 80
//   protocol          = "tcp"
//   cidr_blocks       = ["0.0.0.0/0"]
//   security_group_id = aws_security_group.awsdevbox.id
// }

// Remove Comment if you want to open 443 to public
// resource "aws_security_group_rule" "awsdevbox_in_https" {
//   type              = "ingress"
//   from_port         = 443
//   to_port           = 443
//   protocol          = "tcp"
//   cidr_blocks       = ["0.0.0.0/0"]
//   security_group_id = aws_security_group.awsdevbox.id
// }