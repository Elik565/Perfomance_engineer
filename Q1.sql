create index if not exists t1_id_idx on t1(id);

analyze t1;

explain analyze
select name from t1 where id = 50000;

drop index t1_id_idx;
