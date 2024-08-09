-- Q1 ----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- Find the total milk production for the year 2023.
select sum(Value)
from milk_production mp 
where mp."Year" = 2023

-- Q2 ----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- Show coffee production data for the year 2015.
select *
from coffee_production cp 
where cp."Year" = 2015

-- Q3 ----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- Find the average honey production for the year 2022.
select avg(Value)
from honey_production hp 
where hp."Year" = 2022

-- Q4 ----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- Get the state names with their corresponding ANSI codes from the state_lookup table.
-- What number is Iowa?
select State, State_ANSI
from state_lookup sl 
where sl.State = 'IOWA'

-- Q5 ----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- Find the highest yogurt production value for the year 2022.
select max(Value)
from yogurt_production yp 
where yp."Year" = 2022

-- Q6 ----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- Find states where both honey and milk were produced in 2022.
-- Did State_ANSI "35" produce both honey and milk in 2022?
select DISTINCT hp.State_ANSI
from honey_production hp 
join milk_production mp on hp.State_ANSI = mp.State_ANSI  
where hp."Year" = 2022 and mp."Year" = 2022
--and hp.State_ANSI = 35

-- Q7 ----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- Find the total yogurt production for states that also produced cheese in 2022.
select sum(yp.Value)
from yogurt_production yp 
where yp."Year" = 2022 
AND yp.State_ANSI in (
	select State_ANSI 
	from milk_production mp 
	where mp."Year" = 2022
	)
