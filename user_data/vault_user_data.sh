#! /bin/bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt update
apt install -y vault-enterprise
echo '# Full configuration options can be found at https://www.vaultproject.io/docs/configuration

ui = true

#mlock = true
disable_mlock = true
api_addr   = "http://'$(hostname | awk -F "-" '{print $2"."$3"."$4"."$5}')':8200"
cluster_addr  = "http://'$(hostname | awk -F "-" '{print $2"."$3"."$4"."$5}')':8201"


storage "raft" {
  path = "/opt/vault/data"
  node_id = "'$(hostname)'"
}

#storage "consul" {
#  address = "127.0.0.1:8500"
#  path    = "vault"
#}

# HTTP listener
#listener "tcp" {
#  address = "127.0.0.1:8200"
#  tls_disable = 1
#}

# HTTPS listener
listener "tcp" {
  address       = "0.0.0.0:8200"
  tls_disable   = 1
  cluster_address = "0.0.0.0:8201"
#  tls_cert_file = "/opt/vault/tls/tls.crt"
#  tls_key_file  = "/opt/vault/tls/tls.key"
}

# Enterprise license_path
# This will be required for enterprise as of v1.8
license_path = "/etc/vault.d/vault.hclic"

# Example AWS KMS auto unseal
seal "awskms" {
  region = "us-east-1"
  kms_key_id = "991af8cc-8e7a-4d57-b3e8-e43a082a7cad"
}
# Example HSM auto unseal
#seal "pkcs11" {
#  lib            = "/usr/vault/lib/libCryptoki2_64.so"
#  slot           = "0"
#  pin            = "AAAA-BBBB-CCCC-DDDD"
#  key_label      = "vault-hsm-key"
#  hmac_key_label = "vault-hsm-hmac-key"
#}' > /etc/vault.d/vault.hcl
echo "export VAULT_ADDR='http://127.0.0.1:8200'" > /etc/profile.d/vault_env.sh
