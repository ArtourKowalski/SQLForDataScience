/* Find each user's most recently viewed item for an email campagin */

SELECT
  temp.user_id, temp.email, temp.item_id, temp.item_name, temp.item_category, temp.most_recent_view
FROM
  (
    SELECT
      u.id AS USER_ID,
      u.email_address AS EMAIL,
      i.id AS ITEM_ID,
      i.name AS ITEM_NAME,
      i.category AS ITEM_CATEGORY,
      e.event_time AS MOST_RECENT_VIEW
    FROM
      dsv1069.users u
      JOIN dsv1069.events e ON e.user_id = u.id
      AND EVENT_NAME = 'view_item'
      AND PARAMETER_NAME = 'item_id'
      JOIN dsv1069.items i ON CAST(e.parameter_value AS INT) = i.id
    ORDER BY
      MOST_RECENT_VIEW DESC
  ) TEMP
  INNER JOIN (
    SELECT
      e.user_id,
      MAX(e.event_time) AS RECENT
    FROM
      dsv1069.events e
    WHERE
      EVENT_NAME = 'view_item'
      AND PARAMETER_NAME = 'item_id'
    GROUP BY
      e.user_id
  ) newest_views ON TEMP.user_id = newest_views.user_id
  AND temp.most_recent_view = newest_views.RECENT
