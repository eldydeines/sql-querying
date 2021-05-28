-- Eldy Deines
-- CRUD exercises


--Ex 1: Find the app with an ID of 1880.
SELECT app_name FROM analytics WHERE id = 1880;

--Ex 2: Find the ID and app name for all apps that were last updated on August 01, 2018.
SELECT id, app_name, last_updated FROM analytics WHERE last_updated = 'August 01, 2018';

--Ex 3: Count the number of apps in each category, e.g. “Family | 1972”.
SELECT category, COUNT(app_name) as number_of_apps FROM analytics GROUP BY category;

--EX 4: Find the top 5 most-reviewed apps and the number of reviews for each.
SELECT app_name, reviews FROM analytics ORDER BY reviews desc LIMIT 5;

--EX 5: Find the app that has the most reviews with a rating greater than equal to 4.8.
SELECT app_name, reviews, rating FROM analytics WHERE rating >= 4.8 ORDER BY reviews desc LIMIT 1;

--EX 6: Find the average rating for each category ordered by the highest rated to lowest rated.
SELECT category, AVG(rating) FROM analytics GROUP BY category ORDER BY AVG(rating) desc;

--EX 7: Find the name, price, and rating of the most expensive app with a rating that’s less than 3.
SELECT app_name, price, rating FROM analytics GROUP BY app_name, price, rating 
HAVING rating < 3 ORDER BY price desc LIMIT 1;

--EX 8: Find all apps with a min install not exceeding 50, that have a rating. 
--      Order your results by highest rated first.
SELECT app_name,  rating, min_installs FROM analytics 
WHERE rating > 0 AND min_installs < 50 ORDER BY rating desc;

--EX 9: Find the names of all apps that are rated less than 3 with at least 10000 reviews.
SELECT app_name, rating, reviews FROM analytics WHERE rating < 3 AND reviews > 10000;

--EX 10: Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
SELECT app_name, reviews, price FROM analytics 
WHERE price BETWEEN 0.10 AND 1.00 ORDER BY reviews desc LIMIT 10;

--EX 11: Find the most out of date app. Hint: You don’t need to do it this way, 
-- but it’s possible to do with a subquery: 
SELECT app_name, last_updated FROM analytics WHERE last_updated = (SELECT MIN(last_updated) FROM analytics);

--EX 12: Find the most expensive app (the query is very similar to #11).
SELECT app_name, price FROM analytics WHERE price = (SELECT MAX(price) FROM analytics);

--EX 13: Count all the reviews in the Google Play Store.
SELECT SUM(reviews) as number_of_reviews FROM analytics;

--EX 14: Find all the categories that have more than 300 apps in them.
SELECT category, COUNT(app_name) FROM analytics GROUP BY category HAVING  COUNT(app_name) > 300;

--EX 15: Find the app that has the highest proportion of min_installs to reviews, 
--       among apps that have been installed at least 100,000 times. 
--       Display the name of the app along with the number of reviews, the min_installs, and the proportion.

SELECT app_name, reviews, min_installs, (min_installs/reviews) AS proportion FROM analytics 
WHERE min_installs > 100000 ORDER BY proportion desc LIMIT 1;
