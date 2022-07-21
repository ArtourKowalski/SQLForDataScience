/* Number of unique users that bought from given category */

SELECT
  items.category,
  COUNT(DISTINCT orders.user_id)
FROM
  dsv1069.items items
  JOIN dsv1069.orders orders ON items.id = orders.item_id
GROUP BY
  items.category
ORDER BY
  category DESC;
  
/* Which unique users ever ordered a widget: */

SELECT
  DISTINCT orders.user_id, first_name || ' ' || last_name AS NAME
FROM
  dsv1069.items items
  JOIN dsv1069.orders orders ON items.id = orders.item_id
  JOIN dsv1069.users users ON users.id = orders.user_id
WHERE items.category = 'widget'

/* Number of orders per day - DAILY ROLLUP */

SELECT
  dr.date,
  COALESCE(SUM(ORDER_COUNT), 0) AS ORDERS,
  COALESCE(SUM(ITEMS_ORDERED), 0) AS ITEMS_ORDERED
FROM
  dsv1069.dates_rollup dr
  LEFT OUTER JOIN (
    SELECT
      COUNT(DISTINCT INVOICE_ID) AS ORDER_COUNT,
      COUNT(DISTINCT LINE_ITEM_ID) AS ITEMS_ORDERED,
      DATE(CREATED_AT) AS ORDER_DAY
    FROM
      dsv1069.orders
    GROUP BY
      ORDER_DAY
    ORDER BY
      ORDER_DAY ASC
  ) daily_orders ON daily_orders.ORDER_DAY = dr.date
GROUP BY
  dr.date
  
/* Number of orders weekly - WEEKLY ROLLUP */
  
SELECT
  dr.date,
  COALESCE(SUM(ORDER_COUNT), 0) AS ORDERS,
  COALESCE(SUM(ITEMS_ORDERED), 0) AS ITEMS_ORDERED,
  COUNT(*) AS ROWS
FROM
  dsv1069.dates_rollup dr
  LEFT OUTER JOIN (
    SELECT
      COUNT(DISTINCT INVOICE_ID) AS ORDER_COUNT,
      COUNT(DISTINCT LINE_ITEM_ID) AS ITEMS_ORDERED,
      DATE(CREATED_AT) AS ORDER_DAY
    FROM
      dsv1069.orders
    GROUP BY
      ORDER_DAY
    ORDER BY
      ORDER_DAY ASC
  ) daily_orders ON daily_orders.ORDER_DAY <= dr.date
  AND dr.d7_ago < daily_orders.ORDER_DAY
GROUP BY
  dr.date
ORDER BY
  dr.date
  
  
