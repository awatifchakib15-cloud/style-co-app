# Style & Co — Application de Gestion

> Application web de gestion de stock, mouvements et capital pour une société de vente de vêtements.

## Stack technique
- **Frontend** : React (CDN, fichier unique `index.html`)
- **Base de données** : Supabase (PostgreSQL, plan gratuit)
- **Déploiement** : GitHub Pages (gratuit)

---

## 1. Créer la base de données Supabase (gratuit)

1. Va sur [supabase.com](https://supabase.com) et crée un compte
2. Crée un **nouveau projet** (choisis une région proche : Europe West)
3. Dans le menu de gauche, clique sur **SQL Editor**
4. Copie-colle le contenu de `supabase_schema.sql` et clique **Run**
5. Dans **Project Settings → API**, copie :
   - **Project URL** (ex: `https://xxxx.supabase.co`)
   - **anon / public key** (commence par `eyJ...`)

---

## 2. Déployer sur GitHub Pages (gratuit)

### Première fois
```bash
# 1. Crée un nouveau dépôt sur github.com (ex: style-co-app)

# 2. Clone et push
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/TON_PSEUDO/style-co-app.git
git push -u origin main
```

### Activer GitHub Pages
1. Va dans ton dépôt GitHub → **Settings → Pages**
2. Source : **Deploy from a branch**
3. Branch : **main** / dossier : **/ (root)**
4. Clique **Save**
5. Ton app sera disponible sur : `https://TON_PSEUDO.github.io/style-co-app/`

---

## 3. Premier lancement

Au premier chargement, l'app affiche un écran de configuration :
1. Colle ta **Project URL Supabase**
2. Colle ta **clé anon / public**
3. Clique **Connecter**

Les identifiants sont sauvegardés dans le navigateur (localStorage).  
Pour changer de base : bouton **"Changer de base"** en bas de la sidebar.

---

## Fonctionnalités

### 📊 Tableau de bord
- **Stock** : initial, vendu, expédié, réservé, restant
- **CA** : vendu, expédié, réservé, total + % CA/Capital
- **Tableau stocks restants** par modèle et taille
- **Tableau disponibilités** (hors réservations)

### 👗 Stock / Articles
- Ajouter un article : nom, type, prix de base
- Stock par taille : S, M, L, XL, 2XL, 3XL
- Modifier / supprimer un article

### 📋 Mouvements
- Types : Vente, Expédition, Réservation
- Par article, taille, quantité, prix, commentaire
- Filtrage par type
- Modifier / supprimer un mouvement

### 💰 Capital
- Ajouter des apports (montant, payé par, commentaire)
- Total capital affiché
- Modifier / supprimer un apport

---

## Mises à jour

Pour mettre à jour l'app après modification :
```bash
git add .
git commit -m "Mise à jour"
git push
```
GitHub Pages se met à jour automatiquement en 1-2 minutes.
