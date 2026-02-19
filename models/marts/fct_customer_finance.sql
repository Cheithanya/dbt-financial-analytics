select
    customer_id,

    sum(total_deposits) as lifetime_deposits,
    sum(total_outflows) as lifetime_outfows,
    avg(avg_balance) as avg_balance,
    avg(avg_risk_score) as avg_risk_score,

    case
        when avg(avg_risk_score) > 0.8 then 'high'
        when avg(avg_risk_score) > 0.4 then 'medium'
        else 'low'
    end as risk_segment

from {{ ref('int_customer_monthly') }}
group by 1