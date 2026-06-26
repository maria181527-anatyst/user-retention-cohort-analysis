 WITH users_parsed AS (
  SELECT
    u.user_id,
    u.promo_signup_flag,
    CASE
         WHEN regexp_replace(trim(split_part(signup_datetime, ' ', 1)), '[./]', '-', 'g') ~ '^\d{1,2}-\d{1,2}-\d{4}$'
        THEN to_date(
            regexp_replace(trim(split_part(signup_datetime, ' ', 1)), '[./]', '-', 'g'),
            'DD-MM-YYYY'
        )
   WHEN regexp_replace(trim(split_part(signup_datetime, ' ', 1)), '[./]', '-', 'g') ~ '^\d{1,2}-\d{1,2}-\d{2}$'
   THEN to_date(
            regexp_replace(trim(split_part(signup_datetime, ' ', 1)), '[./]', '-', 'g'),
            'DD-MM-YY'
            )
       ELSE NULL 
    END AS signup_datetime_clean 
FROM cohort_users_raw u
  )
  ,
events_parsed as ( 
  SELECT
   e.user_id,
   e.event_type,
CASE
    WHEN regexp_replace(trim(split_part(event_datetime, ' ', 1)), '[./]', '-', 'g') ~ '^\d{1,2}-\d{1,2}-\d{4}$'
        THEN to_date(
            regexp_replace(trim(split_part(event_datetime, ' ', 1)), '[./]', '-', 'g'),
            'DD-MM-YYYY'
        )
   WHEN regexp_replace(trim(split_part(event_datetime, ' ', 1)), '[./]', '-', 'g') ~ '^\d{1,2}-\d{1,2}-\d{2}$'
   THEN to_date(
            regexp_replace(trim(split_part(event_datetime, ' ', 1)), '[./]', '-', 'g'),
            'DD-MM-YY'
        )
    ELSE NULL
END AS events_datetime_clean
FROM cohort_events_raw e
)
,
user_activity AS (
SELECT
  u.user_id,
  u.promo_signup_flag,
   DATE_TRUNC('month', u.signup_datetime_clean)::date AS cohort_month,
   DATE_TRUNC('month', e.events_datetime_clean)::date AS activity_month,
  ( extract(year from e.events_datetime_clean) - extract(year from u.signup_datetime_clean) ) * 12 
 + 
  ( extract(month from e.events_datetime_clean) - extract(month from u.signup_datetime_clean) ) AS month_offset
FROM users_parsed u
JOIN events_parsed e ON e.user_id = u.user_id 
WHERE 
  e.event_type is not null
 and e.event_type <> 'test_event'
 and u.signup_datetime_clean is not null
 and e.events_datetime_clean is not null
)
SELECT 
   promo_signup_flag,
   cohort_month,
   month_offset,
   COUNT (distinct user_id) as user_total
 FROM user_activity
 WHERE activity_month between '2025-01-01' and '2025-06-01'
 GROUP BY 
   promo_signup_flag,
   cohort_month,
   month_offset
 ORDER BY 
   promo_signup_flag,
   cohort_month,
   month_offset
 
