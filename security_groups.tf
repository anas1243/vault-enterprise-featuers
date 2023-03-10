# vault sg
resource "aws_security_group" "vault_vms_sg" {
  vpc_id = module.network.vpc_id
  tags = {
    Name = "vault_vms_sg"
    Env  = var.env
  }
}

# Open port 22 for ssh vault vms
resource "aws_vpc_security_group_ingress_rule" "vault_vms_sg_ingress_ssh" {
  security_group_id = aws_security_group.vault_vms_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}
# Open port 8200 and 8201 for exposing vault clusters and internal communicate
resource "aws_vpc_security_group_ingress_rule" "vault_vms_sg_ingress_exposure" {
  security_group_id = aws_security_group.vault_vms_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 8200
  ip_protocol = "tcp"
  to_port     = 8201
}

resource "aws_vpc_security_group_egress_rule" "vault_vms_sg_egress" {
  security_group_id = aws_security_group.vault_vms_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = -1
}