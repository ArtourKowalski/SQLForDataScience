Exercise 1: Without worrying about deleted user or merged users, count the number of users
added each day:

SELECT
  COUNT(ID),
  DATE(CREATED_AT) AS CREATION_DATE
FROM
  dsv1069.users
GROUP BY
  CREATION_DATE
ORDER BY
  CREATION_DATE DESC;

Exercise 2: Count the number of users deleted each day. Then count the number of users
removed due to merging in a similar way.

SELECT
  DATE(DELETED_AT) AS deletion_date,
  COUNT(1) AS users_removed
FROM
  dsv1069.users
WHERE
  DELETED_AT IS NOT NULL
GROUP BY
  deletion_date;
  
 SELECT
  DATE(merged_at) AS merge_date,
  COUNT(1) AS users_removed
FROM
  dsv1069.users
WHERE
  merged_at IS NOT NULL
GROUP BY
  merge_date;
  
Exercise 3: Use the pieces you’ve built as subtables and create a table that has a column for
the date, the number of users created, the number of users deleted and the number of users
merged that day

SELECT
  DATE(CREATED_AT) AS CREATION_DATE,
  COUNT(CREATED_AT) AS USERS_ADDED,
  COUNT(DELETED_AT) AS USERS_REMOVED,
  COUNT(MERGED_AT) AS USERS_MERGED
FROM
  dsv1069.users
GROUP BY
  CREATION_DATE
ORDER BY
  CREATION_DATE DESC;
  
Exercise 7:
What if there were days where no users were created, but some users were deleted or merged.
Does the previous query still work? No, it doesn’t. Use the dates_rollup as a backbone for this
query, so that we won’t miss any dates.

SELECT
  COUNT(CREATED_AT) AS USERS_ADDED,
  COUNT(DELETED_AT) AS USERS_REMOVED,
  COUNT(MERGED_AT) AS USERS_MERGED,
  COUNT(CREATED_AT) - (COUNT(DELETED_AT) + COUNT(MERGED_AT)) AS NET_USERS_ADDED,
  CASE
    WHEN CREATED_AT IS NULL THEN (
      SELECT
        DATE
      FROM
        dsv1069.dates_rollup
    )
    ELSE DATE(CREATED_AT)
  END DATE
FROM
  dsv1069.users
GROUP BY
  DATE
ORDER BY
  DATE DESC;
