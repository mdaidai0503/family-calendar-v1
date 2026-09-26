-- Family Calendar v2 band display migration
-- v1の既存データを残したまま複数日予定に対応します。

alter table public.family_events
  add column if not exists end_date date;

update public.family_events
set end_date = event_date
where end_date is null;

alter table public.family_events
  alter column end_date set not null;

alter table public.family_events
  add column if not exists all_day boolean not null default false;

update public.family_events
set all_day = true
where start_time is null and end_time is null;

alter table public.family_events
  drop constraint if exists family_events_date_range_check;

alter table public.family_events
  add constraint family_events_date_range_check
  check (end_date >= event_date);

create index if not exists family_events_date_range_idx
  on public.family_events(event_date, end_date);
