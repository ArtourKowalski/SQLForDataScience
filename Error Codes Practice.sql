Exercise 1:
Goal: Here we use users table to pull a list of user email addresses. Edit the query to pull email
addresses, but only for non-deleted users.
Starter Code:

  SELECT email_address
  FROM dsv1069.users
  WHERE deleted_at IS NULL;

Exercise 2:
--Goal: Use the items table to count the number of items for sale in each category
Starter Code: (none)

  SELECT COUNT(1), category
  FROM dsv1069.items
  GROUP BY category;

Exercise 3:
--Goal: Select all of the columns from the result when you JOIN the users table to the orders
table
Starter Code: (none)

  SELECT * FROM dsv1069.users u
  JOIN dsv1069.orders o ON 
  u.id = o.user_id;

Exercise 4:
--Goal: Check out the query below. This is not the right way to count the number of viewed_item
events. Determine what is wrong and correct the error.
Starter Code:

  SELECT
  COUNT(event_id) AS events
  FROM dsv1069.events
  WHERE EVENT_NAME IN ('view_item')

Exercise 5:
--Goal:Compute the number of items in the items table which have been ordered. The query
below runs, but it isn’t right. Determine what is wrong and correct the error or start from scratch.
Starter Code:
--Error: This query runs but the number isn’t right

  SELECT COUNT(DISTINCT id)
  FROM dsv1069.orders o
  JOIN dsv1069.items i ON 
  o.item_id = i.id;

Exercise 6:
--Goal: For each user figure out IF a user has ordered something, and when their first purchase
was. The query below doesn’t return info for any of the users who haven’t ordered anything.

   SELECT DISTINCT u.id, u.first_name || ' ' || u.last_name AS full_name, MIN(o.created_at) AS first_order
    FROM dsv1069.users U 
    LEFT JOIN dsv1069.orders O 
    ON u.id = o.user_id
    GROUP BY u.id, full_name;

Exercise 7:
--Goal: Figure out what percent of users have ever viewed the user profile page, but this query
isn’t right. Check to make sure the number of users adds up, and if not, fix the query.

SELECT 
    CAST((SELECT COUNT(DISTINCT USER_ID)
    FROM dsv1069.events 
    WHERE event_name IN ('view_user_profile')) AS REAL) 
    /
    CAST((SELECT COUNT(DISTINCT USER_ID)
    FROM dsv1069.events) AS REAL) * 100 AS PCT;
