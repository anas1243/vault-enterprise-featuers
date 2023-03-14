#! /bin/bash

# Enable kv-v2 and auth method
vault secrets enable -path=kv kv-v2

# Enable userpass auth method
vault auth enable userpass

# Create simple policy for user to test kv-v2
cat <<EOF > vault-basic-operations/simple-policy.hcl
path "kv/+/anas"{
 capabilities = ["create", "update", "delete", "list", "read", "patch"]
}
EOF
vault policy write simple-policy vault-basic-operations/simple-policy.hcl

# Create new user
vault write auth/userpass/users/anosa password="marianas" policies="simple-policy"