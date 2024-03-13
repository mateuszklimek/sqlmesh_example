MODEL (
  name sqlmesh_example.full_model,
  kind FULL,
  cron '@daily',
  grain item_id,
  audits (assert_positive_order_ids),
);

SELECT
  item_id,
  count(distinct id) AS num_orders,
  1 as one
FROM
    sqlmesh_example.incremental_model
GROUP BY item_id
