/* Find each user's most recently viewed item for an email campaign - this time using Window Function */

SELECT
  *
FROM
  (
    SELECT
      u.id AS USER_ID,
      u.email_address AS EMAIL,
      i.id AS ITEM_ID,
      i.name AS ITEM_NAME,
      i.category AS ITEM_CATEGORY,
      e.event_time AS MOST_RECENT_VIEW,
      RANK () OVER (
        PARTITION BY user_id
        ORDER BY
          e.event_time DESC
      ) AS VIEW_NUM
    FROM
      dsv1069.users u
      JOIN dsv1069.events e ON e.user_id = u.id
      AND EVENT_NAME = 'view_item'
      AND PARAMETER_NAME = 'item_id'
      JOIN dsv1069.items i ON CAST(e.parameter_value AS INT) = i.id
    ORDER BY
      MOST_RECENT_VIEW DESC
  ) TEMP
WHERE
  TEMP.VIEW_NUM = 1;

/* Find first order date per customer - this time using Window Function */

SELECT
  DISTINCT *
FROM
  (
    SELECT
      o.invoice_id,
      o.created_at,
      o.user_id,
      RANK () OVER (
        PARTITION BY user_id
        ORDER BY
          CREATED_AT ASC
      ) AS ORDER_NUM
    FROM
      dsv1069.orders o
  ) A
WHERE
  A.ORDER_NUM = 1
