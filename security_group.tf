resource "aws_security_group" "allow-tls" {
  name        = "allow-tls"
  description = "Permite acesso TLS na porta 22"

  ingress {
    description = "TLS para VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-tls"
  }
}
