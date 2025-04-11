create index if not exists t1_idname_idx on t1(id) where name like 'a%';
create index if not exists t2_tidday_idx on t2(t_id, day);

set enable_seqscan = OFF;
set max_parallel_workers_per_gather = 4;
set enable_hashjoin = off;
set work_mem = '32MB';
set effective_cache_size = '4GB';

analyze t1;
analyze t2;

explain (analyze, buffers)
select MAX(t2.day)
from t2
where exists (
  select 1 from t1 where t1.id = t2.t_id and t1.name like 'a%'
);

drop index t1_idname_idx;
drop index t2_tidday_idx;
