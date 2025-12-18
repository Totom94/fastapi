# FastAPI Deployment Project

## Description
Projet démontrant le déploiement d'une application **FastAPI** avec **PostgreSQL** en utilisant **Docker**, automatisé via **Ansible** et **Terraform**.  

Le projet est structuré pour supporter un workflow complet :
- Niveau 0 : VM avec application et base de données accessibles depuis Internet.
- Niveau 1 : Déploiement automatisé de l'application sur la VM via Ansible.
- Niveau 2 : Déploiement complet de la VM + application avec Terraform + Ansible.

---

## Déploiement

### Prérequis
- Python >= 3.11
- Docker et Docker Compose
- Ansible
- Terraform
- Clé SSH pour se connecter à la VM

### Commandes principales
1. Déployer l’infrastructure et l’application :
```bash
make deploy

---

docker ps

GET /           → Version de PostgreSQL
GET /items      → Liste des items dans la table `test`

