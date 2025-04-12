create index t1_id_idx on t1(id);
create index t2_tidday_idx on t2(t_id, day);

set enable_seqscan = "off";
set work_mem = '256MB';

analyze t1;
analyze t2;

explain (analyze, buffers)
select day from t2 where t_id not in ( select t1.id from t1);

drop index t1_id_idx;
drop index t2_tidday_idx;