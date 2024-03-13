MODEL (
    name sqlmesh_example.orders,
    kind SEED (
        path '../seeds/orders.csv'
    ),
    columns (
        order_id INTEGER,
        customer_id INTEGER,
        order_date DATE,
        total_amount DECIMAL,
        payment_method VARCHAR,
        shipping_method VARCHAR,
        product_ids VARCHAR,
        rating INTEGER
    ),
    grain (order_id)
);