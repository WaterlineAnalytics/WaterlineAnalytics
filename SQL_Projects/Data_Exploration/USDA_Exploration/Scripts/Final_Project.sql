-- Q1 ----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- Can you find out the total milk production for 2023? Your manager wants this information for the yearly report.
-- What is the total milk production for 2023?
select sum(Value) as TotalProd
from milk_production mp 
where mp."Year" = 2023
-- > 91812000000 L of milk were produced in 2023


-- Q2 ----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- Which states had cheese production greater than 100 million in April 2023? The Cheese Department wants to focus their marketing efforts there.
-- How many states are there?
select count(*)
from cheese_production
where "Year" = 2023
and Period = 'APR'
and Value > 100000000;
-- > 2 states had cheese production greater than 100 million in April 2023


-- Q3 ----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- Your manager wants to know how coffee production has changed over the years.
-- What is the total value of coffee production for 2011?
select cop."Year", Value as TotalProd
from coffee_production cop
where cop."Year" = 2011--group by cop."Year"
-- >  The total value of coffee production for 2011 was 7600000


-- Q4 ----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- There's a meeting with the Honey Council next week.
-- Find the average honey production for 2022 so you're prepared.
select hp."Year", avg(Value) as AvgProd
from honey_production hp 
where hp."Year" = 2022 --group by hp."Year"
-- > The average honey production for 2022 is 3133275.0


-- Q5 ----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- The State Relations team wants a list of all states names with their corresponding ANSI codes.
-- Can you generate that list?
-- What is the State_ANSI code for Florida?
select *
from state_lookup sl 
where State = 'FLORIDA'
-- > State_ANSI code for Florida is 12


-- Q6 ----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- For a cross-commodity report, can you list all states with their cheese production values,
-- even if they didn't produce any cheese in April of 2023?
-- What is the total for NEW JERSEY?
select sl.State, sl.State_ANSI, cp."Year", sum(Value)
from state_lookup sl 
left join cheese_production cp 
	on sl.State_ANSI = cp.State_ANSI and cp."Year" = 2023 and cp.Period ='APR'
group by sl.State, sl.State_ANSI 
having sl.State = 'NEW JERSEY';
order by CAST(sl.State_ANSI as INTEGER)
-- > The total cheese production of New Jersey in April of 2023 is 4889000


-- Q7 ----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- Can you find the total yogurt production for states in the year 2022 which also have cheese production data from 2023?
-- This will help the Dairy Division in their planning.
SELECT sum(TotalProdperState) as TotalProd
from (select yp.State_ANSI, sum(yp.Value) as TotalProdperState
from yogurt_production yp 
where yp."Year" = 2022
and yp.State_ANSI in (
						select State_ANSI
						from cheese_production cp 
						where cp."Year" = 2023)
group by yp.State_ANSI )

-- > The total yogurt production for states in 2022 which also have cheese production in 2023 is 1171095000 


-- Q8 ----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- List all states from state_lookup that are missing from milk_production in 2023.
-- How many states are there ?
select count(sl.State)--, mp.Value
from state_lookup sl 
left join milk_production mp 
	on sl.State_ANSI = mp.State_ANSI and mp."Year" = 2023
where mp.Value is null

-- > There are 26 states who have missing data in 2023 in the milk_production table.


-- Q9 ----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- List all states with their cheese production values, including states that didn't produce any cheese in April 2023.
-- Did Delaware produce any cheese in April 2023?
select sl.State, sl.State_ANSI, cp.Value
from state_lookup sl 
left join cheese_production cp on sl.State_ANSI = cp.State_ANSI and cp."Year" = 2023 and cp.Period ="APR"
--where sl.State = 'DELAWARE';

-- > Delaware did not produce any cheese in April of 2023.


-- Q10 ---------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- Find the average coffee production for all years where the honey production exceeded 1 million.

SELECT AVG(cp.Value) AS avgCoffeeProduction
FROM coffee_production cp
WHERE cp.Year IN (
    SELECT hp.Year
    FROM honey_production hp
    WHERE hp.Value > 1000000
);

-- > The average coffee production for all years where the honey production exceeded 1 million is 6426666.666666667
