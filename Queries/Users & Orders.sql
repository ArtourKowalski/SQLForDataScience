/* How many times do users order from specific category? */

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
  
  /* How many times do users order a specific item? */
  
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
  
  
