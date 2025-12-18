SHELL := /bin/bash
# Indique que deploy n’est pas un fichier mais une cible
.PHONY: deploy

# exécute le script de déploiement
deploy:
	@bash scripts/deploy.sh
