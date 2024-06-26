# Generate a key pair for EC2 instances
resource "tls_private_key" "deployer_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "deployer_key" {
  key_name   = "deployer_key"
  public_key = tls_private_key.deployer_key.public_key_openssh
}
