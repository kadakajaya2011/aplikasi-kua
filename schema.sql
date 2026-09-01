-- DATABASE ONLINE P3NR
-- Jalankan seluruh script ini di Supabase > SQL Editor.

create table if not exists public.p3nr_state (
  id text primary key,
  records jsonb not null default '[]'::jsonb,
  petugas jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.p3nr_state enable row level security;

-- Hapus policy lama jika setup dijalankan ulang.
drop policy if exists "P3NR authenticated read" on public.p3nr_state;
drop policy if exists "P3NR authenticated insert" on public.p3nr_state;
drop policy if exists "P3NR authenticated update" on public.p3nr_state;

create policy "P3NR authenticated read"
on public.p3nr_state for select
to authenticated
using (true);

create policy "P3NR authenticated insert"
on public.p3nr_state for insert
to authenticated
with check (true);

create policy "P3NR authenticated update"
on public.p3nr_state for update
to authenticated
using (true)
with check (true);

-- Baris awal. Data register tetap kosong sampai petugas memasukkan data.
insert into public.p3nr_state (id, records, petugas)
values (
  'main',
  '[]'::jsonb,
  '{
    "nama":"ASEP SURYANA",
    "wilayah":"KADAKAJAYA",
    "kua":"KUA KECAMATAN TANJUNGSARI",
    "kecamatan":"TANJUNGSARI",
    "kabupaten":"SUMEDANG",
    "kepalaDesa":"SUPENDI",
    "alamatKantor":"Jln. Desa Kadakajaya No.13, Kec. Tanjungsari, Kab. Sumedang, Kode Pos 45363",
    "telepon":"082218687778",
    "website":"https://www.desakadakajaya.sumedangkab.go.id",
    "email":"kadakajaya2011@gmail.com"
  }'::jsonb
)
on conflict (id) do nothing;
