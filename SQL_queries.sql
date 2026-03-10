create database MarketingAnalysis

Use MarketingAnalysis
select top 10 *
from marketing_campaign

select count(*) as total_customers
from marketing_campaign

select
sum(cast(AcceptedCmp1 as INT)) as Campaign1,
sum(cast(AcceptedCmp2 as INT)) as Campaign2,
sum(cast(AcceptedCmp3 as INT)) as Campaign3,
sum(cast(AcceptedCmp4 as INT)) as Campaign4,
sum(cast(AcceptedCmp5 as INT)) as Campaign5,
sum(cast(Response as INT)) as LastCampaign
from marketing_campaign

select
count(*) as total_customers,
sum(cast(Response as INT)) as conversions,
round(
	sum(cast(Response as float ))/
count(*) * 100,
2) as conversion_rate
from marketing_campaign

select
case
when try_cast(Income as float) < 30000 then 'Low Income'
when try_cast(Income as float) between 30000 and 70000 then 'Middle Income'
else 'High Income'
end as income_group,
count(*) as customers,
sum(cast(Response as INT)) as Conversions
from marketing_campaign
group by 
case
when try_cast(Income as float) < 30000 then 'Low Income'
when try_cast(Income as float) between 30000 and 70000 then 'Middle Income'
else 'High Income'
end
order by customers desc

select
sum(MntWines) as Wines,
sum(MntMeatProducts) as Meat,
sum(MntFruits) as Fruits,
sum(MntFishProducts) as Fish,
sum(MntSweetProducts) as Sweets,
sum(MntGoldProds) as Gold
from marketing_campaign

select
sum (NumWebPurchases) as WebPurchases,
sum (NumStorePurchases) as StorePurchases,
sum (NumCatalogPurchases) as CatalogPurchases
from marketing_campaign