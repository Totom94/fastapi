terraform {
  required_providers { hcloud = { source = "hetznercloud/hcloud" } }
}
# Token API Hetzner
variable "hcloud_token" {}

# Chemin vers la clé publique SSH
variable "ssh_key" {}

# Configuration du provider Hetzner
provider "hcloud" { token = var.hcloud_token }

# Création du serveur cloud
resource "hcloud_server" "node" {
  name     = "fastapi"
  image    = "rocky-9"
  server_type = "cpx11"
  location = "nbg1"
  # Association de la clé SSH au serveur
  ssh_keys = [hcloud_ssh_key.key.id]
}
resource "hcloud_ssh_key" "key" {
  name       = "default"
  public_key = file(var.ssh_key)
}

# Sortie de l'adresse IPv4 du serveur
output "ipv4" { value = hcloud_server.node.ipv4_address }
