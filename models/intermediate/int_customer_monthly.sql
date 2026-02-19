select
    customer_id,
    date_trunc(transaction_date, month) as txn_month,

    sum(case when transaction_type = 'deposit'
             then transaction_amount else 0 end) as total_deposits,

    sum(case when transaction_type in ('withdrawal', 'payment')
             then transaction_amount else 0 end) as total_outflows,

    avg(account_balance) as avg_balance,
    avg(risk_score) as avg_risk_score

from {{ ref('stg_transactions') }}
group by 1,2
