resource "aws_iam_instance_profile" "vault_vms_iam_instance_profile" {
  name = "vault_vms_iam_instance_profile"
  role = data.aws_iam_role.vault_vms_iam_role.name
}

data "aws_iam_role" "vault_vms_iam_role" {
  name = "Vault_touse_kms"
}