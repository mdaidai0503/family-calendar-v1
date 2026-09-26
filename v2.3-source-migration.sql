-- 家族カレンダー v2.3 元予定表参照機能
-- 月間・週間予定表の原画像をSupabase Storageに保存し、アプリから参照します。

create table if not exists public.schedule_sources (
  id uuid primary key default gen_random_uuid(),
  source_type text not null check (source_type in ('monthly','weekly')),
  member_index integer not null default 3 check (member_index between 0 and 3),
  period_start date not null,
  period_end date not null,
  file_path text not null unique,
  file_name text,
  created_at timestamptz not null default now(),
  check (period_end >= period_start)
);

alter table public.schedule_sources enable row level security;

drop policy if exists "schedule_sources_all" on public.schedule_sources;
create policy "schedule_sources_all"
on public.schedule_sources
for all
to anon
using (true)
with check (true);

insert into storage.buckets (id, name, public)
values ('family-schedule-sources','family-schedule-sources',false)
on conflict (id) do update set public=false;

drop policy if exists "family_schedule_sources_select" on storage.objects;
create policy "family_schedule_sources_select"
on storage.objects for select
to anon
using (bucket_id = 'family-schedule-sources');

drop policy if exists "family_schedule_sources_insert" on storage.objects;
create policy "family_schedule_sources_insert"
on storage.objects for insert
to anon
with check (bucket_id = 'family-schedule-sources');

drop policy if exists "family_schedule_sources_update" on storage.objects;
create policy "family_schedule_sources_update"
on storage.objects for update
to anon
using (bucket_id = 'family-schedule-sources')
with check (bucket_id = 'family-schedule-sources');

drop policy if exists "family_schedule_sources_delete" on storage.objects;
create policy "family_schedule_sources_delete"
on storage.objects for delete
to anon
using (bucket_id = 'family-schedule-sources');

create index if not exists schedule_sources_period_idx
on public.schedule_sources(member_index, source_type, period_start, period_end);
