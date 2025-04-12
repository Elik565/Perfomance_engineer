create index t2_tidday_idx on t2(t_id, day);
create index t1_id_idx on t1(id);

set work_mem = "256MB";

explain analyze
select day from t2 where t_id in ( select t1.id from t1 where t2.t_id = t1.id) and day > to_char(date_trunc('day',now()- '1 months'::interval),'yyyymmdd');

drop index t2_tidday_idx;
drop index t1_id_idx;