Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10000 
ii. Business table = 10000 
iii. Category table = 10000
iv. Checkin table = 10000 
v. elite_years table = 10000
vi. friend table = 10000 
vii. hours table = 10000 
viii. photo table = 10000 
ix. review table = 10000 
x. tip table = 10000 
xi. user table = 10000 
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = 10000
ii. Hours = 1562
iii. Category = 2643
iv. Attribute = 1115
v. Review = 10000 for id (PK), 9581 for user_id (FK), 8090 for business_id (FK)
vi. Checkin = 493
vii. Photo = 10000 for id (PK), 6493 for business_id (FK)
viii. Tip = 537 for user_id, 3979 for business_id
ix. User = 10000
x. Friend = 11
xi. Elite_years = 2780

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: no
	
	
	SQL code used to arrive at answer:
	
	SELECT *
	FROM user
	WHERE id IS NULL
		OR name IS NULL
		OR review_count IS NULL
		OR yelping_since IS NULL
		OR useful IS NULL
		OR funny IS NULL
		OR cool IS NULL
		OR fans IS NULL
		OR average_stars IS NULL
		OR compliment_hot IS NULL
		OR compliment_more IS NULL
		OR compliment_profile IS NULL
		OR compliment_cute IS NULL
		OR compliment_list IS NULL
		OR compliment_note IS NULL
		OR compliment_plain IS NULL
		OR compliment_cool IS NULL
		OR compliment_funny IS NULL
		OR compliment_writer IS NULL
		OR compliment_photos IS NULL
	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min: 1		max: 5		avg: 3.7082 
		
	
	ii. Table: Business, Column: Stars
	
		min: 1.0	max: 5.0 	avg: 3.6549 
		
	
	iii. Table: Tip, Column: Likes
	
		min: 0		max: 2		avg: 0.0144 
		
	
	iv. Table: Checkin, Column: Count
	
		min: 1		max: 53		avg: 1.9414 
		
	
	v. Table: User, Column: Review_count
	
		min: 0		max: 2000 	avg: 24.2995 
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
	
	    SELECT city, SUM(review_count)
		FROM business
		ORDER BY  review_count DESC
	
	Copy and Paste the Result Below:
	
	-----------------+-------------------+
	| city            | SUM (review_count) |
	+-----------------+-------------------+
	| Las Vegas       |             82854 |
	| Phoenix         |             34503 |
	| Toronto         |             24113 |
	| Scottsdale      |             20614 |
	| Charlotte       |             12523 |
	| Henderson       |             10871 |
	| Tempe           |             10504 |
	| Pittsburgh      |              9798 |
	| MontrÃ©al       |              9448 |
	| Chandler        |              8112 |
	| Mesa            |              6875 |
	| Gilbert         |              6380 |
	| Cleveland       |              5593 |
	| Madison         |              5265 |
	| Glendale        |              4406 |
	| Mississauga     |              3814 |
	| Edinburgh       |              2792 |
	| Peoria          |              2624 |
	| North Las Vegas |              2438 |
	| Markham         |              2352 |
	| Champaign       |              2029 |
	| Stuttgart       |              1849 |
	| Surprise        |              1520 |
	| Lakewood        |              1465 |
	| Goodyear        |              1155 |
	+-----------------+-------------------+
	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

	SELECT stars, COUNT(stars)
	FROM business
	WHERE city = 'Avon'
	GROUP BY stars;

Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):

	+-------+--------------+
	| stars | COUNT(stars) |
	+-------+--------------+
	|   1.5 |            1 |
	|   2.5 |            2 |
	|   3.5 |            3 |
	|   4.0 |            2 |
	|   4.5 |            1 |
	|   5.0 |            1 |
	+-------+--------------+

ii. Beachwood

SQL code used to arrive at answer:

	SELECT stars, COUNT(stars)
	FROM business
	WHERE city = 'Beachwood'
	GROUP BY stars;

Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
		
	+-------+--------------+
	| stars | COUNT(stars) |
	+-------+--------------+
	|   2.0 |            1 |
	|   2.5 |            1 |
	|   3.0 |            2 |
	|   3.5 |            2 |
	|   4.0 |            1 |
	|   4.5 |            2 |
	|   5.0 |            5 |
	+-------+--------------+

7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
	
	SELECT name, review_count
	FROM user
	ORDER BY review_count DESC
	LIMIT 3;
		
	Copy and Paste the Result Below:
		
	+--------+--------------+
	| name   | review_count |
	+--------+--------------+
	| Gerald |         2000 |
	| Sara   |         1629 |
	| Yuri   |         1339 |
	+--------+--------------+

8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:
	
	No, as you can see below, people with most reviews do not have the largest fan base
	
	+-----------+--------------+------+
	| name      | review_count | fans |
	+-----------+--------------+------+
	| Gerald    |         2000 |  253 |
	| Sara      |         1629 |   50 |
	| Yuri      |         1339 |   76 |
	| .Hon      |         1246 |  101 |
	| William   |         1215 |  126 |
	| Harald    |         1153 |  311 |
	| eric      |         1116 |   16 |
	| Roanna    |         1039 |  104 |
	| Mimi      |          968 |  497 |
	| Christine |          930 |  173 |
	| Ed        |          904 |   38 |
	| Nicole    |          864 |   43 |
	| Fran      |          862 |  124 |
	| Mark      |          861 |  115 |
	| Christina |          842 |   85 |
	| Dominic   |          836 |   37 |
	| Lissa     |          834 |  120 |
	| Lisa      |          813 |  159 |
	| Alison    |          775 |   61 |
	| Sui       |          754 |   78 |
	| Tim       |          702 |   35 |
	| L         |          696 |   10 |
	| Angela    |          694 |  101 |
	| Crissy    |          676 |   25 |
	| Lyn       |          675 |   45 |
	+-----------+--------------+------+
	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer:

	There are more reviews with "love" word.
	
	SQL code used to arrive at answer:

	select count(id)
	from review
	where text LIKE '%love%'
	
	UNION ALL
	
	select count(id)
	from review
	where text LIKE '%hate%'
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
	
	SELECT name, review_count, fans
	FROM user
	ORDER BY fans DESC
	LIMIT 10;
	
	Copy and Paste the Result Below:

	+-----------+--------------+------+
	| name      | review_count | fans |
	+-----------+--------------+------+
	| Amy       |          609 |  503 |
	| Mimi      |          968 |  497 |
	| Harald    |         1153 |  311 |
	| Gerald    |         2000 |  253 |
	| Christine |          930 |  173 |
	| Lisa      |          813 |  159 |
	| Cat       |          377 |  133 |
	| William   |         1215 |  126 |
	| Fran      |          862 |  124 |
	| Lissa     |          834 |  120 |
	+-----------+--------------+------+
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.

I have chosen Phoenix as a city and Food as a category as it has 4 businesses to rely my analysis on - Starbucks, Safeway Food & Drug, Water N Ice and Bootleggers Modern American Smokehouse
	
i. Do the two groups you chose to analyze have a different distribution of hours?

Unfortunately, only 2 businesses have data about open hours - Starbucks and Bootleggers Modern American Smokehouse. Starbucks is usually open from 5:00 to 20:00 and is in lower rating group where as American Smokehouse is open from 11:00 to 22:00 which might correlate with the rating.

ii. Do the two groups you chose to analyze have a different number of reviews?
         
Yes, lower rating group seems to have much less reviews than Higher Rating group, although Water N Ice has only 4 reviews and is in Higher Rating group, which might change in a future.
	 
iii. Are you able to infer anything from the location data provided between these two groups? Explain.

The location and neighborhood data doesn't provide sufficient details to reach any major conclusion for chosen City.

SQL code used for analysis:

	SELECT b.name
			,b.city
			,b.postal_code
			,b.neighborhood
			,c.category
			,b.review_count
			,h.hours
			,CASE 
				WHEN b.stars BETWEEN 2
						AND 3
					THEN 'Low Rated'
				WHEN b.stars BETWEEN 4
						AND 5
					THEN 'High Rated'
				END BUSINESS_RATING
	FROM business b
	JOIN category c ON b.id = c.business_id
	LEFT JOIN hours h ON b.id = h.business_id
	WHERE b.city = 'Phoenix'
		AND c.category = 'Food'
	ORDER BY BUSINESS_RATING DESC;	
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:
     
Open Businesses have higher rating compared to closed ones:

	+---------------+---------+
	|    AVG(stars) | is_open |
	+---------------+---------+
	| 3.55263157895 |       0 |
	|  3.6554770318 |       1 |
	+---------------+---------+ 
         
ii. Difference 2:
         
Open Businesses have higher review count compared to closed ones:  

   +-------------------+---------+
	| AVG(review_count) | is_open |
	+-------------------+---------+
	|     27.9736842105 |       0 |
	|     35.6313309776 |       1 |
	+-------------------+---------+   
         
SQL code used for analysis:

	SELECT AVG(stars), IS_OPEN
	FROM business b
	WHERE b.city = 'Phoenix'
	GROUP BY IS_OPEN;
	
	SELECT AVG(review_count), IS_OPEN
	FROM business b
	WHERE b.city = 'Phoenix'
	GROUP BY IS_OPEN;
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
 
I wanted to find the correlation between the city and number of tips that businesses get from the clients (Maybe clients from certain cities are more generous).
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
                           
1. I will need to get the total amount of tips per city and then start analysis on the winner.
2. After choosing winner, I will try to find the correlation between star rating and number of tips.
3. Then, I will check what neighborhoods get the most tips.
	 
iii. Output of your finished dataset:
         
	+------------+------------+
	| NO_OF_TIPS | city       |
	+------------+------------+
	|        396 | Pittsburgh |
	|         23 | Homestead  |
	|         18 | Las Vegas  |
	+------------+------------+     

	+------------+-------+----------------------------------------+--------------+-------------------+
	| NO_OF_TIPS | stars | name                                   | neighborhood | business_category |
	+------------+-------+----------------------------------------+--------------+-------------------+
	|         51 |   3.0 | Mad Mex - South Hills                  |              | Mexican           |
	|         36 |   4.5 | Page Dairy Mart                        | South Side   | Other             |
	|         21 |   3.5 | Ritters Diner                          | Bloomfield   | Other             |
	|         17 |   3.0 | Namaste India                          | Banksville   | Other             |
	|         11 |   3.5 | Planet Fitness - Pittsburgh - Edgewood |              | Other             |
	|         10 |   4.0 | Nicky's Thai Kitchen                   | Downtown     | Other             |
	|         10 |   2.0 | Starbucks                              |              | Other             |
	|          9 |   3.5 | Bistro Penn                            | Downtown     | Other             |
	|          8 |   4.5 | Cathedral of Learning                  | Oakland      | Other             |
	|          8 |   4.0 | Crepes Parisiennes                     | Oakland      | Other             |
	+------------+-------+----------------------------------------+--------------+-------------------+

	+------------+-------+----------------+
	| NO_OF_TIPS | stars | neighborhood   |
	+------------+-------+----------------+
	|         89 |   4.5 |                |
	|         65 |   4.0 | South Side     |
	|         38 |   4.5 | Strip District |
	|         36 |   4.0 | Bloomfield     |
	|         36 |   3.5 | Downtown       |
	|         36 |   3.5 | Oakland        |
	|         17 |   3.0 | Banksville     |
	|         15 |   3.5 | Squirrel Hill  |
	|         12 |   4.0 | Lawrenceville  |
	|         11 |   3.5 | North Side     |
	+------------+-------+----------------+


	 
iv. Provide the SQL code you used to create your final dataset:

	SELECT COUNT(t.TEXT) AS NO_OF_TIPS, b.city
	FROM tip t
	JOIN business b ON
	t.business_id = b.id
	GROUP BY city
	ORDER BY NO_OF_TIPS DESC
	LIMIT 3;

	SELECT COUNT(t.TEXT) AS NO_OF_TIPS
	,b.city
	,CASE 
		WHEN c.category IS NULL
			THEN 'Other'
		ELSE c.category
		END business_category
	FROM tip t
	JOIN business b ON t.business_id = b.id
	LEFT JOIN category c ON c.business_id = b.id
	WHERE CITY = 'Pittsburgh'
	GROUP BY c.category
	ORDER BY NO_OF_TIPS DESC
	
	SELECT COUNT(t.TEXT) AS NO_OF_TIPS, b.stars, b.neighborhood
	FROM tip t
	JOIN business b ON
	t.business_id = b.id
	WHERE CITY = 'Pittsburgh'
	GROUP BY b.neighborhood
	ORDER BY NO_OF_TIPS DESC
    LIMIT 10;
	
	
