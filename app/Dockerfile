FROM python:3.11-slim
# Dossier de travail
WORKDIR /app
# Copie des dépendances 
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
#RUN pip install fastapi uvicorn
# Copie du code source
COPY . .
# Commande de démarrage de l'application FastAPI
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
