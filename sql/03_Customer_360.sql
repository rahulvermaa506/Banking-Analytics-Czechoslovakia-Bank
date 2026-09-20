use alabs

select * from clean.client_clean

--- Customer 360 

-- account transaction summary 

select account_id ,
COUNT(*) as total_transaction , 
sum(amount) as total_transaction_amount , 
AVG(amount) as avg_transaction_amount ,
MAX(amount) as max_transaction_amount ,
min(date) as first_trasaction_date ,
max(date) as last_transaction_date ,
sum(case when type = 'Credit' then amount else 0 end) as total_credit_amount ,
sum(case when type = 'Withdrawal' then amount else 0 end) as total_Withdrawal_amount,
sum(case when purpose = 'Loan Payment' then amount else 0 end) as total_loan_payment_amount 
from clean.transactions_clean
group by account_id

-- account loan summary 

select account_id , 
count(*) as total_loan ,
sum(amount) as total_loan_amount , 
avg(amount) as avg_loan_amount ,
min(cast(date as date)) as first_loan_date ,
sum(problem_loan_flag) as problematic_loan_count
from clean.loan_clean
group by account_id


-- account order summary 

select account_id ,
COUNT(*) as total_orders,
sum(amount) as total_order_amount,
avg(amount) as avg_order_amount 
from clean.orders_clean
group by account_id

-- account card summary 
select
d.account_id , 
sum(case when c.type = 'classic' then 1 else 0 end) as  total_classic_card,
sum(case when c.type = 'junior' then 1 else 0 end) as  total_junior_card,
sum(case when c.type = 'gold' then 1 else 0 end) as  total_gold_card,
count(*) as total_card 
from clean.card_clean as c
join clean.disp_clean as d 
on c.disp_id = d.disp_id
where d.type = 'OWNER'
group by d.account_id;




-------------------------------------------------------- Account 360 ----------------------------------------------

with tran_summary as (select 
					  account_id ,
					  COUNT(*) as total_transaction , 
					  sum(amount) as total_transaction_amount , 
					  AVG(amount) as avg_transaction_amount ,
					  MAX(amount) as max_transaction_amount ,
					  min(date) as first_trasaction_date ,
					  max(date) as last_transaction_date ,
					  sum(case when type = 'Credit' then amount else 0 end) as total_credit_amount ,
					  sum(case when type = 'Withdrawal' then amount else 0 end) as total_Withdrawal_amount,
					  sum(case when purpose = 'Loan Payment' then amount else 0 end) as total_loan_payment_amount 
					  from clean.transactions_clean
					  group by account_id
							),
loan_summary as (
				select account_id , 
				count(*) as total_loan ,
				sum(amount) as total_loan_amount , 
				avg(amount) as avg_loan_amount ,
				min(cast(date as date)) as first_loan_date ,
				sum(problem_loan_flag) as problematic_loan_count
				from clean.loan_clean
				group by account_id
				),
order_summary as (
				select account_id ,
				COUNT(*) as total_orders,
				sum(amount) as total_order_amount,
				avg(amount) as avg_order_amount 
				from clean.orders_clean
				group by account_id	
				) ,
card_summary as (
				select
				d.account_id , 
				sum(case when c.type = 'classic' then 1 else 0 end) as  total_classic_card,
				sum(case when c.type = 'junior' then 1 else 0 end) as  total_junior_card,
				sum(case when c.type = 'gold' then 1 else 0 end) as  total_gold_card,
				count(*) as total_card 
				from clean.card_clean as c
				join clean.disp_clean as d 
				on c.disp_id = d.disp_id
				where d.type = 'OWNER'
				group by d.account_id
				)
select 
a.account_id,
a.account_type,
a.date,
d.[district name] ,
d.region,
a.frequency,
t.first_trasaction_date,
t.last_transaction_date,
t.total_transaction,
t.total_credit_amount,
t.total_Withdrawal_amount,
t.avg_transaction_amount ,
t.max_transaction_amount ,
t.total_transaction_amount ,
t.total_loan_payment_amount,
coalesce(l.total_loan,0) as total_loan ,
coalesce(l.total_loan_amount,0) as total_loan_amount,
l.first_loan_date,
coalesce(l.avg_loan_amount,0) as avg_loan_amount ,
coalesce(l.problematic_loan_count,0) as problematic_loan_count ,
coalesce(o.total_orders,0) as total_orders, 
coalesce(o.total_order_amount,0) as total_order_amount,
coalesce(o.avg_order_amount,0) as avg_order_amount , 
coalesce(c.total_classic_card,0) as total_classic_card , 
coalesce(c.total_gold_card,0) as total_gold_card , 
coalesce(c.total_junior_card,0) as total_junior_card ,
coalesce(c.total_card,0) as total_card
into account_360
from clean.account_clean a
left join tran_summary  t on a.account_id = t.account_id
left join loan_summary l on a.account_id = l.account_id
left join order_summary o on a.account_id = o.account_id
left join card_summary c on a.account_id = c.account_id
left join clean.district_clean d on a.district_id = d.district_id

----------------------------------------------------- view account 360 -------------------------------------------------------------------
create view account360 as 
with tran_summary as (select 
					  account_id ,
					  COUNT(*) as total_transaction , 
					  sum(amount) as total_transaction_amount , 
					  AVG(amount) as avg_transaction_amount ,
					  MAX(amount) as max_transaction_amount ,
					  min(date) as first_trasaction_date ,
					  max(date) as last_transaction_date ,
					  sum(case when type = 'Credit' then amount else 0 end) as total_credit_amount ,
					  sum(case when type = 'Withdrawal' then amount else 0 end) as total_Withdrawal_amount,
					  sum(case when purpose = 'Loan Payment' then amount else 0 end) as total_loan_payment_amount 
					  from clean.transactions_clean
					  group by account_id
							),
loan_summary as (
				select account_id , 
				count(*) as total_loan ,
				sum(amount) as total_loan_amount , 
				avg(amount) as avg_loan_amount ,
				min(cast(date as date)) as first_loan_date ,
				sum(problem_loan_flag) as problematic_loan_count
				from clean.loan_clean
				group by account_id
				),
order_summary as (
				select account_id ,
				COUNT(*) as total_orders,
				sum(amount) as total_order_amount,
				avg(amount) as avg_order_amount 
				from clean.orders_clean
				group by account_id	
				) ,
card_summary as (
				select
				d.account_id , 
				sum(case when c.type = 'classic' then 1 else 0 end) as  total_classic_card,
				sum(case when c.type = 'junior' then 1 else 0 end) as  total_junior_card,
				sum(case when c.type = 'gold' then 1 else 0 end) as  total_gold_card,
				count(*) as total_card 
				from clean.card_clean as c
				join clean.disp_clean as d 
				on c.disp_id = d.disp_id
				where d.type = 'OWNER'
				group by d.account_id
				)
select 
a.account_id,
a.account_type,
a.date,
a.frequency,
t.first_trasaction_date,
t.last_transaction_date,
t.total_transaction,
t.total_credit_amount,
t.total_Withdrawal_amount,
t.avg_transaction_amount ,
t.max_transaction_amount ,
t.total_transaction_amount ,
t.total_loan_payment_amount,
coalesce(l.total_loan,0) as total_loan ,
coalesce(l.total_loan_amount,0) as total_loan_amount,
l.first_loan_date,
coalesce(l.avg_loan_amount,0) as avg_loan_amount ,
coalesce(l.problematic_loan_count,0) as problematic_loan_count ,
coalesce(o.total_orders,0) as total_orders, 
coalesce(o.total_order_amount,0) as total_order_amount,
coalesce(o.avg_order_amount,0) as avg_order_amount , 
coalesce(c.total_classic_card,0) as total_classic_card , 
coalesce(c.total_gold_card,0) as total_gold_card , 
coalesce(c.total_junior_card,0) as total_junior_card ,
coalesce(c.total_card,0) as total_card
from clean.account_clean a
left join tran_summary  t on a.account_id = t.account_id
left join loan_summary l on a.account_id = l.account_id
left join order_summary o on a.account_id = o.account_id
left join card_summary c on a.account_id = c.account_id
left join clean.district_clean d on a.district_id = d.district_id

--============================================== customer 360 =============================================================================

with client_summary as (
						select c.client_id,d.account_id ,
						sum(case when d.type ='OWNER' then 1 else 0 end) as is_account_owner ,
						sum(case when d.type ='USER' then 1 else 0 end) as is_account_user 
						from clean.client_clean as c
						join clean.disp_clean as d on c.client_id = d.client_id
						group by c.client_id ,d.account_id
						),
client_account_summary as (
						select client_id ,
						count(distinct account_id) as total_account
						from clean.disp_clean
						group by client_id
						)
select c.*,
d.[district name] as client_district,
d.region as client_region,
s.total_account,
cl.is_account_owner ,
cl.is_account_user ,
a.total_transaction , a.total_credit_amount , a.total_Withdrawal_amount ,
a.avg_transaction_amount , a.max_transaction_amount , a.total_transaction_amount ,
a.total_loan , a.total_loan_amount , a.avg_loan_amount , a.problematic_loan_count ,
a.total_orders , a.total_order_amount , total_classic_card , a.total_junior_card , a.total_gold_card
,a.total_card
into customer_360
from clean.client_clean as c
left join client_summary as cl on c.client_id = cl.client_id
left join account_360 as a on cl.account_id = a.account_id
left join clean.district_clean as d on c.district_id = d.district_id
left join client_account_summary as s on c.client_id = s.client_id













