MODEL (
    name sqlmesh_example.orders_by_day,
    kind INCREMENTAL_BY_TIME_RANGE (
        time_column (order_date, '%Y-%m-%d')
    )
);

SELECT
  order_date,
  count(distinct order_id) AS num_orders,
  sum(total_amount) AS total_amount
FROM
    sqlmesh_example.orders
WHERE
    order_date BETWEEN @start_date AND @end_date
GROUP BY order_date
