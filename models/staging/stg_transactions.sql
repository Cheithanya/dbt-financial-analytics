select
    TransactionID as transaction_id,
    CustomerID as customer_id,
    AccountID as account_id,
    lower(AccountType) as account_type,
    lower(TransactionType) as transaction_type,
    Product as product,
    Firm as firm,
    Region as region,
    Manager as manager,

    cast(TransactionDate as date) as transaction_date,

    TransactionAmount as transaction_amount,
    AccountBalance as account_balance,
    RiskScore as risk_score,
    CreditRating as credit_rating,
    TenureMonths as tenure_months

from {{ source('financial_raw', 'transactions') }}
