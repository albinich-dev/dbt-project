{{
    config (
        engine='MergeTree()',
        order_by=['LO_ORDERDATE', 'LO_ORDERKEY']
    )
}}

select * from {{ source('dbgen', 'lineorder')}}