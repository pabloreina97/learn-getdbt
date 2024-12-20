with

    source as (select * from {{ source("jaffle_shop", "orders") }}),

    transformed as (
        select
            id as order_id,
            user_id as customer_id,
            order_date as order_placed_at,
            status as order_status,

            case
                when status not in ('return', 'return_pending') then order_date
            end as value_order_date,
        from source
    )

select *
from transformed
