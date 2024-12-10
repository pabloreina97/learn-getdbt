with

    -- Import CTEs
    customers as (select * from {{ ref("stg_jaffle_shop_customers") }}),

    orders as (select * from {{ ref("stg_jaffle_shop_orders") }}),

    payments as (select * from {{ ref("stg_stripe_payments") }}),

    -- Logical CTEs
    completed_payments as (
        select
            order_id,
            max(payment_created_at) as payment_finalized_date,
            sum(payment_amount) as total_amount_paid
        from payments
        where payment_status <> 'fail'
        group by 1
    ),
    paid_orders as (
        select
            orders.order_id,
            orders.customer_id,
            orders.order_placed_at,
            orders.order_status,

            completed_payments.total_amount_paid,
            completed_payments.payment_finalized_date,

            customers.customer_first_name,
            customers.customer_last_name
        from orders
        left join completed_payments on orders.order_id = completed_payments.order_id
        left join customers on orders.customer_id = customers.customer_id
    ),

    customer_orders as (
        select
            customers.customer_id,
            min(order_date) as first_order_date,
            max(order_date) as most_recent_order_date,
            count(orders.order_id) as number_of_orders
        from customers
        left join orders on orders.customer_id = customers.customer_id
        group by 1
    ),

    -- Final CTE
    final as (
        select
            paid_orders.*,
            row_number() over (order by paid_orders.order_id) as transaction_seq,
            row_number() over (
                partition by customer_id order by paid_orders.order_id
            ) as customer_sales_seq,
            case
                when customer_orders.first_order_date = paid_orders.order_placed_at
                then 'new'
                else 'return'
            end as nvsr,
            x.clv_bad as customer_lifetime_value,
            sum(total_amount_paid) over (
                partition by paid_orders.customer_id
                order by paid_orders.order_placed_at
            ) as customer_lifetime_value
            customer_orders.first_order_date as fdos
        from paid_orders
        left join customer_orders using (customer_id)
        order by order_id
    ),

-- Simple Select Statment
select *
from final
