-- Style & Co — Schéma Supabase
-- À exécuter dans l'éditeur SQL de Supabase (https://supabase.com/dashboard)

-- Table articles (stock)
create table if not exists articles (
  id uuid default gen_random_uuid() primary key,
  nom text not null,
  type text not null,
  prix_base numeric(10,2) not null default 0,
  stock_s integer not null default 0,
  stock_m integer not null default 0,
  stock_l integer not null default 0,
  stock_xl integer not null default 0,
  stock_2xl integer not null default 0,
  stock_3xl integer not null default 0,
  created_at timestamptz default now()
);

-- Table mouvements
create table if not exists mouvements (
  id uuid default gen_random_uuid() primary key,
  article_id uuid references articles(id) on delete cascade,
  type text not null check (type in ('reservation','expedition','vente')),
  taille text not null check (taille in ('S','M','L','XL','2XL','3XL')),
  quantite integer not null default 1,
  prix numeric(10,2) not null default 0,
  commentaire text,
  created_at timestamptz default now()
);

-- Table capital
create table if not exists capital (
  id uuid default gen_random_uuid() primary key,
  montant numeric(10,2) not null,
  paye_par text not null,
  commentaire text,
  created_at timestamptz default now()
);

-- Activer Row Level Security (RLS) avec accès public pour simplifier le déploiement
alter table articles enable row level security;
alter table mouvements enable row level security;
alter table capital enable row level security;

-- Policies : accès complet sans authentification (pour usage interne)
create policy "public_all_articles" on articles for all using (true) with check (true);
create policy "public_all_mouvements" on mouvements for all using (true) with check (true);
create policy "public_all_capital" on capital for all using (true) with check (true);
