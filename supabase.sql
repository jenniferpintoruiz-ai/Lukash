-- ============================================================
-- LUKA$H — Configuración Supabase (plan gratuito)
-- Ejecutar UNA sola vez en: Supabase Dashboard > SQL Editor
-- ============================================================

-- Tabla de perfiles: 1 fila por usuario de Supabase Auth.
-- 'completadas' guarda las categorías terminadas como array de nombres.
create table if not exists public.perfiles (
  id          uuid primary key references auth.users(id) on delete cascade,
  nombre      text default '',
  edad        int,
  ciudad      text default '',
  completadas text[] default '{}'
);

-- RLS: cada usuario solo puede ver/crear/editar SU propia fila
alter table public.perfiles enable row level security;

create policy "leer propio perfil"
  on public.perfiles for select
  using (auth.uid() = id);

create policy "crear propio perfil"
  on public.perfiles for insert
  with check (auth.uid() = id);

create policy "editar propio perfil"
  on public.perfiles for update
  using (auth.uid() = id);