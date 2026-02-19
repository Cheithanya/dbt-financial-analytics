{{ config(
    materialized = 'incremental',
    unique_key = 'transaction_id'
) }}

select * 
from {{ ref('stg_transactions') }}

{% if is_incremental() %}
    WHERE
        transaction_date > (
            select max(transaction_date) from {{ this }}
        )
{% endif %}

