# PostgreSQL Admin Notes

## Use `pg_dump`

```
pg_dump -h 123.123.123.123 -U intcrm -W -Fc -d db_name > somefile.dump
```

## Use `pg_restore`

```
pg_restore -h 123.123.123.123 -U db_user -W -Fc -d db_name --no-owner somefile.dump
```

## Kill off other DB connections

```sql
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'TARGET_DB' -- ← change this to your DB
  AND pid <> pg_backend_pid();
```
