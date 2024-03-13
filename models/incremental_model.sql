MODEL (
  name sqlmesh_example.incremental_model,
  kind INCREMENTAL_BY_TIME_RANGE (
    time_column (event_date, '%Y-%m-%d')
  ),
  grains ((id, event_date))
);

SELECT
  id,
  item_id,
  'z' AS new_column, /* Added column */
  'a' AS new_column2,
  event_date
FROM sqlmesh_example.seed_model
WHERE
  event_date BETWEEN @start_date AND @end_date