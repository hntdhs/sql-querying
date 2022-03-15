-- Comments in SQL Start with dash-dash --
-- 1. Find the entire record for the app with an ID of `1880`.
SELECT * FROM analytics WHERE id = 1880;
-- is it necessary to use * when you're only looking for one item?

-- 2. Find the ID and app name for all apps that were last updated on August 01, 2018.
SELECT id, app_name FROM analytics WHERE last_updated;

-- 3. Count the number of apps in each category, e.g. "Family | 1972".
SELECT category COUNT(*) FROM analytics GROUP BY category;
-- why did they put the asterisk in parentheses?

-- 4. Find the top 5 most-reviewed apps and the number of reviews for each.
SELECT * FROM analytics ORDER BY reviews DESC LIMIT 5;
-- I'm lost here - how does this get the number of reviews for each app?

-- 5. Find the full record of the app that has the most reviews with a rating greater than or equal to 4.8
SELECT * FROM analytics WHERE rating >= 4.8 ORDER BY reviews LIMIT 1; 

-- 6. Find the average rating for each category ordered by the highest rated to lowest rated.
SELECT category AVG(rating) FROM analytics ORDER BY avg DESC;

-- 7. Find the name, price, and rating of the most expensive app with a rating that's less than 3
SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1;

-- 8. Find all records with a min install not exceeding 50, that have a rating. Order your results by highest rated first.
SELECT * FROM analytics WHERE min_installs <= 50 AND rating IS NOT NULL 
ORDER BY rating DESC;

-- 9. Find the names of all apps that are rated less than 3 with at least 10000 reviews.
SELECT app_name FROM analytics WHERE rating < 3 AND reviews >= 10000
-- I wanted to do select * instead of app_name, opposite of earlier problem

-- 10. Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
SELECT * FROM analytics WHERE price BETWEEN 0.1 and 1 ORDER BY reviews DESC 
LIMIT 10;

-- 11. Find the most out of date app. 
SELECT * FROM analytics ORDER BY last_updated LIMIT 1;
-- Two things - comparing the select statement to the one in 9, I still dont understand when to do asterisk or not; and also why isn't there an order by descending or ascending on this one?

-- 12. Find the most expensive app.
SELECT * FROM analytics ORDER BY price DESC LIMIT 1;

-- 13. Count all reviews in the store.
SELECT SUM(reviews) FROM analytics;

-- 14. Find all categories with more than 300 apps.
SELECT category FROM analytics GROUP BY category HAVING COUNT(*) > 300;
-- 2 things - asterisk in parentheses again, and why do we need to specify that we're grouping by category when category is all we selected?

-- 15. Find the app that has the highest proportion of min_installs to reviews, among apps that have been installed at least 100,000 times. Display the name of the app along with the number of reviews, the min_installs, and the proportion.
SELECT app_name, reviews, min_installs,  min_installs / reviews AS proportion
  FROM analytics
  WHERE min_installs >= 100000
  ORDER BY proportion DESC
  LIMIT 1;