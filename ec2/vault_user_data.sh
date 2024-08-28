#!/bin/bash
set -e

# Update the package list and install required packages
apt-get update -y
apt-get install -y unzip curl

# Install HashiCorp Vault
VAULT_VERSION="1.12.0"  # Specify the Vault version
curl -LO https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip
unzip vault_${VAULT_VERSION}_linux_amd64.zip
mv vault /usr/local/bin/

# Create a systemd service file for Vault
cat <<EOF > /etc/systemd/system/vault.service
[Unit]
Description=HashiCorp Vault
Documentation=https://www.vaultproject.io/docs
After=network-online.target
Wants=network-online.target

[Service]
User=root
ExecStart=/usr/local/bin/vault server -config=/etc/vault.d/vault.hcl
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

# Create Vault configuration directory and file
mkdir -p /etc/vault.d
cat <<EOF > /etc/vault.d/vault.hcl
storage "file" {
  path = "/opt/vault/data"
}

listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = 1
}

ui = true
EOF

# Create data directory for Vault
mkdir -p /opt/vault/data

# Start and enable the Vault service
systemctl enable vault
systemctl start vault

# Wait for Vault to start up
sleep 10

# Initialize Vault (you might want to add a script or manual step here)
# vault operator init > /root/vault-init.txt

# Unseal Vault (you will need to provide unseal keys manually or automate this step securely)
# vault operator unseal <unseal_key>

# Login to Vault (you will need a root token or a method to authenticate)
# vault login <root_token>
