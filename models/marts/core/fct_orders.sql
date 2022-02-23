with customers as (
    select * from {{ ref("stg_customers") }}
),

orders as (
    select * from {{ ref("stg_orders") }}
),

payments as (
    select * from {{ ref("stg_payments") }}
),

order_payments as (

    select
        customer_id,
        order_id,
        payments.amount
    

    from orders
    left join payments on payments.orderid = order_id

)

select * from order_payments
order by customer_id
