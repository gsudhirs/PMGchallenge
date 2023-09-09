SELECT date, SUM(impressions) AS total_impressions
FROM marketing_data
GROUP BY date
ORDER BY date;

SELECT state, SUM(revenue) AS total_revenue
FROM website_revenue
GROUP BY state
ORDER BY total_revenue DESC
LIMIT 3;

SELECT
    ci.name AS campaign_name,
    SUM(md.cost) AS total_cost,
    SUM(md.impressions) AS total_impressions,
    SUM(md.clicks) AS total_clicks,
    SUM(wr.revenue) AS total_revenue
FROM
    campaign_info ci
LEFT JOIN
    marketing_data md
ON
    ci.id = md.campaign_id
LEFT JOIN
    website_revenue wr
ON
    ci.id = wr.campaign_id
GROUP BY
    ci.name
ORDER BY
    ci.name;

SELECT
    wr.state,
    SUM(md.conversions) AS total_conversions
FROM
    marketing_data md
INNER JOIN
    website_revenue wr
ON
    md.campaign_id = wr.campaign_id
INNER JOIN
    campaign_info ci
ON
    md.campaign_id = ci.id
WHERE
    ci.name = 'Campaign5'
GROUP BY
    wr.state;

SELECT
    c.name AS campaign_name,
    SUM(wr.revenue) AS total_revenue,
    SUM(mp.cost) AS total_cost,
    (SUM(wr.revenue) - SUM(mp.cost)) / SUM(mp.cost) AS roi
FROM
    campaign_info c
JOIN
    marketing_data mp ON c.id = mp.campaign_id
JOIN
    website_revenue wr ON c.id = wr.campaign_id
GROUP BY
    c.name
ORDER BY
    roi DESC;

SELECT
    DAYNAME(date) AS day_of_week,
    AVG(impressions) AS avg_impressions,
    AVG(clicks) AS avg_clicks,
    AVG(conversions) AS avg_conversions
FROM
    marketing_data
GROUP BY
    day_of_week
ORDER BY
    avg_conversions DESC;
