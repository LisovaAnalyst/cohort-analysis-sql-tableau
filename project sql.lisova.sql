with users_prepared as (
select  
user_id
, promo_signup_flag
, case when signup_datetime is null then null
else 
  case 
 when split_part(split_part(replace(replace(trim(signup_datetime::text), '.', '-'), '/', '-'), ' ', 1), '-', 3)::int < 100
 then make_date(
      split_part(split_part(replace(replace(trim(signup_datetime::text), '.', '-'), '/', '-'), ' ', 1), '-', 3)::int + 2000,
      split_part(split_part(replace(replace(trim(signup_datetime::text), '.', '-'), '/', '-'), ' ', 1), '-', 2)::int,
      split_part(split_part(replace(replace(trim(signup_datetime::text), '.', '-'), '/', '-'), ' ', 1), '-', 1)::int)
 else make_date(
      split_part(split_part(replace(replace(trim(signup_datetime::text), '.', '-'), '/', '-'), ' ', 1), '-', 3)::int,
      split_part(split_part(replace(replace(trim(signup_datetime::text), '.', '-'), '/', '-'), ' ', 1), '-', 2)::int,
      split_part(split_part(replace(replace(trim(signup_datetime::text), '.', '-'), '/', '-'), ' ', 1), '-', 1)::int)
 end::timestamp
 end as signup_ts
    from project.cohort_users_raw
),
events_prepared as (
    select 
    user_id
    ,event_type,
    case when event_datetime is null then null
    else case 
       when split_part(split_part(replace(replace(trim(event_datetime::text), '.', '-'), '/', '-'), ' ', 1), '-', 3)::int < 100
       then make_date(
            split_part(split_part(replace(replace(trim(event_datetime::text), '.', '-'), '/', '-'), ' ', 1), '-', 3)::int + 2000,
            split_part(split_part(replace(replace(trim(event_datetime::text), '.', '-'), '/', '-'), ' ', 1), '-', 2)::int,
            split_part(split_part(replace(replace(trim(event_datetime::text), '.', '-'), '/', '-'), ' ', 1), '-', 1)::int)
    else make_date(
            split_part(split_part(replace(replace(trim(event_datetime::text), '.', '-'), '/', '-'), ' ', 1), '-', 3)::int,
            split_part(split_part(replace(replace(trim(event_datetime::text), '.', '-'), '/', '-'), ' ', 1), '-', 2)::int,
            split_part(split_part(replace(replace(trim(event_datetime::text), '.', '-'), '/', '-'), ' ', 1), '-', 1)::int)
    end::timestamp
    end as event_ts
    from project.cohort_events_raw
    where event_type is not null and event_type not like 'test_event'
),
final_table_data as (
    select e.user_id
    , u.promo_signup_flag
    , date_trunc('month', u.signup_ts)::date as cohort_month
    , date_trunc('month', e.event_ts)::date as activity_month
    , (extract(year from age(date_trunc('month', e.event_ts), date_trunc('month', u.signup_ts))) * 12 +
    extract(month from age(date_trunc('month', e.event_ts), date_trunc('month', u.signup_ts)))) as month_offset
    from events_prepared e
    join users_prepared u on e.user_id = u.user_id)
select 
promo_signup_flag
, cohort_month
, month_offset
, count(distinct user_id) as users_total
from final_table_data
where activity_month between '2025-01-01' and '2025-06-01'
group by 1, 2, 3
order by 1, 2, 3;


