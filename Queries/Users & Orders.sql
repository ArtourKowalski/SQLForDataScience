/* How many unique users are there and how many unique users ordered an item? */

SELECT
  'ALL USERS COUNT' AS USER_COUNT,
  COUNT(DISTINCT ID)
FROM
  dsv1069.users
UNION
ALL
SELECT
  'USERS WITH ORDERS COUNT' AS USER_ORDER_COUNT,
  COUNT(DISTINCT ID)
FROM
  DSV1069.USERS u
  JOIN dsv1069.orders O ON u.id = o.user_id;

/* How many times did users order from specific category? */

SELECT
  DISTINCT USER_ID,
  item_category,
  COUNT(*) OVER (
    PARTITION BY USER_ID,
    ITEM_CATEGORY
    ORDER BY
      user_id
  ) AS no_of_item_orders
FROM
  DSV1069.ORDERS
ORDER BY
  no_of_item_orders DESC,
  user_id DESC;
  
  /* How many times did users order a specific item? */
  
  SELECT
  DISTINCT USER_ID,
  line_item_id,
  COUNT(*) OVER (
    PARTITION BY USER_ID,
    line_item_id
    ORDER BY
      user_id
  ) AS no_of_item_orders
FROM
  DSV1069.ORDERS
ORDER BY
  no_of_item_orders DESC,
  user_id DESC;
  
  /* How many times did user order in total? */
  
SELECT
  DISTINCT user_id,
  COUNT(invoice_id) OVER (PARTITION BY user_id) AS total_orders
FROM
  dsv1069.orders
ORDER BY
  total_orders DESC

  /* What is the most expensive item per order */
  
  SELECT
  *
FROM
  (
    SELECT
      invoice_id,
      item_id,
      price,
      created_at,
      RANK () OVER (
        PARTITION BY invoice_id
        ORDER BY
          price DESC
      ) AS MOST_EXPENSIVE_ITEM
    FROM
      DSV1069.ORDERS
  ) TEMP
WHERE
  TEMP.MOST_EXPENSIVE_ITEM = 1
ORDER BY
  INVOICE_ID DESC;
