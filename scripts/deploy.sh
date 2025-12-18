#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

export HCLOUD_TOKEN=${HCLOUD_TOKEN:-$(read -p "Hetzner token: " -r t; echo "$t")}
export PUBLIC_SSH_KEY=${PUBLIC_SSH_KEY:-$HOME/.ssh/id_rocky.pub}

# 1. Terraform
pushd terraform
terraform init
terraform apply -auto-approve -var="hcloud_token=$HCLOUD_TOKEN" -var="ssh_key=$PUBLIC_SSH_KEY"
IP=$(terraform output -raw ipv4)
popd

# 2. Ansible inventory
echo "[app]" > ansible/inventory.ini
echo "$IP ansible_user=root ansible_ssh_private_key_file=$HOME/.ssh/id_rocky" >> ansible/inventory.ini

# 3. Ansible deploy
pushd ansible
ansible-playbook -i inventory.ini playbook.yml
popd

echo "App disponible sur http://$IP:8000"
