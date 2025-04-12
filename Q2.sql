create index if not exists t1_idname_idx on t1(id) where name like 'a%';
create index if not exists t2_tidday_idx on t2(t_id, day);

set enable_seqscan = "off";
set enable_hashjoin = "off";
set work_mem = '32MB';
SET max_parallel_workers_per_gather = 6;

analyze t1;
analyze t2;

explain (analyze, buffers)
select max(t2.day) from t2 left join t1 on t2.t_id = t1.id and t1.name like 'a%';

drop index t1_idname_idx;
drop index t2_tidday_idx;
SET max_parallel_workers_per_gather = 4;