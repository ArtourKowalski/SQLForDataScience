SELECT
  u.id,
  CASE
    WHEN DATE(u.CREATED_AT) = DATE(NOW()) THEN '1'
    ELSE '0'
  END CREATED_TODAY,
  CASE
    WHEN u.DELETED_AT IS NULL THEN '0'
    ELSE '1'
  END IS_DELETED,
  CASE
    WHEN u.DELETED_AT IS NOT NULL
    AND DATE(u.DELETED_AT) = DATE(NOW()) THEN '1'
    ELSE '0'
  END DELETED_TODAY,
  CASE
    WHEN o.INVOICE_ID IS NULL THEN '0'
    ELSE '1'
  END HAS_EVER_ORDERED,
  CASE
    WHEN DATE(o.CREATED_AT) = DATE(NOW()) THEN '1'
    ELSE '0'
  END ORDERED_TODAY,
  DATE(NOW())
FROM
  dsv1069.users u
  LEFT JOIN dsv1069.orders o ON u.id = o.user_id