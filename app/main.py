from fastapi import FastAPI
from sqlalchemy import create_engine, text
import os


# Récupère l'URL de la base
DB_URL = os.getenv("DB_URL", "postgresql+psycopg2://user:pass123@db:5432/items")

# Création du moteur SQLAlchemy
# pool_pre_ping=True permet de vérifier que la connexion est toujours valide
engine = create_engine(DB_URL, pool_pre_ping=True)

# Initialisation de l'application FastAPI
app = FastAPI(title="Fast API")




# se connecte à la base PostgreSQL, requête, retourne la version de PostgreSQL
@app.get("/")
def read_root():
    try:
	# Ouverture d'une connexion depuis le pool
        with engine.connect() as conn:
	    # Exécution d'une requête SQL
            ver = conn.execute(text("SELECT version()")).scalar()
	# Réponse JSON
        return {"db_version": ver}
    except Exception as e:
        # Capture toute erreur
        return {"error": str(e)}



# Liste des items
@app.get("/items")
def read_items():
    try:
        with engine.connect() as conn:
            # Remplacer  par le nom exact de la table
            result = conn.execute(text("SELECT * FROM test")).fetchall()
        # Transforme chaque ligne en dictionnaire
        items = [dict(row._mapping) for row in result]
        return items
    except Exception as e:
        return {"error": str(e)}
