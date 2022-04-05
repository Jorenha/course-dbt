
### The following contains answers to Week 3 questions
PART 1

I created a snapshot based on the order staging model and saved it in the snapshot directory. Running the dbt snapshot command was successful. 

Part 2
I built the fact_sessions model to enable users to see conversion on a day to day basis.

The data is quite limited in scope, but we can see that conversion was 0 on 02-09, 100% on 02-10 and 46% from level 1 to level 3 on 02-11.

BI tools such as Tableau and looker allow you to visualize these funnels neatly. That's why I created a distinct count of sessions for each date. This would allow me to either look at the conversion from one day to another, or aggregate it by level to see our overall conversion. 

As per the instruction I created a exposure.yml file in my marts directory. I referenced the fact_sessions model. 

Part 3
3B
Our dbt runs are scheduled on a daily basis using cloud composer. The steps involves a dbt source freshness check, dbt run and finally a dbt test over the source models. Currently, these are configured as warnings only, so that the models will still be updated even if there are some violations (ie. a source freshness test for a table failed, but other source table still contain up to date data). At the moment this serves our purpose well as it allows us to make models avialable to data consumers with as much fresh data as is available to us. 

