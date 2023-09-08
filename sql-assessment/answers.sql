--1.Write a query to get the sum of impressions by day.
SELECT date, SUM(impressions) AS total_impressions FROM markteting_data
GROUP BY date;

--2. Write a query to get the top three revenue-generating states in order of best to worst. How much revenue did the third best state generate?
--The third best state, OH, generated 37577
SELECT state, SUM(revenue) AS total_revenue FROM website_revenue
GROUP BY state
ORDER BY total_revenue DESC;


--3.Write a query that shows total cost, impressions, clicks, and revenue of each campaign. Make sure to include the campaign name in the output.
SELECT ci.name, SUM(md.cost), SUM(md.impressions), SUM(md.clicks), SUM(wr.revenue) FROM marketing_data AS md
JOIN campaign_info AS ci ON ci.id=md.campaign_id
JOIN website_revenue AS wr ON wr.campaign_id=md.campaign_id
GROUP BY ci.name;



--4. Write a query to get the number of conversions of Campaign5 by state. Which state generated the most conversions for this campaign?
--GA generated the most conversions for Campaign5
SELECT md.geo, SUM(md.conversions) FROM marketing_data AS md
JOIN campaign_info AS ci ON ci.id = md.campaign_id
WHERE ci.name = 'Campaign5'
GROUP BY md.geo;

--5. In your opinion, which campaign was the most efficient, and why?
--Campaign4 has the highest cost of revenue ratio so I would say they were the most efficient. 
SELECT ci.name, SUM(md.conversions), SUM(md.cost), SUM(md.impressions), SUM(md.conversions), SUM(md.clicks), SUM(wr.revenue), SUM(md.cost)/SUM(wr.revenue) FROM marketing_data AS md
JOIN campaign_info AS ci ON ci.id = md.campaign_id
JOIN website_revenue AS wr ON wr.campaign_id=md.campaign_id
GROUP BY ci.name;

--Write a query that showcases the best day of the week (e.g., Sunday, Monday, Tuesday, etc.) to run ads.
--Sketch of code: extract the day of the week from the date variable in marketing_data. Then use a metric such as SUM(conversions) or SUM(impressions) based on what one defines is the best metric for this questions
--Then GROUP BY the date and sort based off the chosen metric
