-- a very simple dbt model that selects only the best shapes
select
    *
from
   dbt_testing.raw_data.shapes
where
    shape_name in ('CIRCLE', 'TRIANGLE')