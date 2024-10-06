--Question 1
SELECT s.film_title, s.release_year, r.worldwide_gross
FROM specs as s
LEFT JOIN revenue as r
USING(movie_id)
ORDER BY r.worldwide_gross;
--Answer: "Semi-Tough"


--Question 2
SELECT s.release_year, AVG(r.imdb_rating) as avg_rating
FROM specs as s
LEFT JOIN rating as r
USING(movie_id)
GROUP BY s.release_year
ORDER BY avg_rating DESC;
--Answer:  1991
--Answer: "Semi-Tough"


--Question 3
SELECT s.film_title, s.mpaa_rating, r.worldwide_gross, d.company_name
FROM specs as s
LEFT JOIN revenue as r
USING(movie_id)
LEFT JOIN distributors as d
ON s.domestic_distributor_id = d.distributor_id
WHERE s.mpaa_rating='G'
ORDER BY r.worldwide_gross DESC;
--Answer: Toy Story 4


--Question 4
SELECT d.company_name, COUNT(s.domestic_distributor_id ) AS dist_count
FROM distributors AS d
LEFT JOIN specs AS s
ON d.distributor_id = s.domestic_distributor_id 
GROUP BY d.company_name
ORDER BY dist_count DESC;


--Question 5
SELECT d.company_name, AVG(r.film_budget) AS avg_budget
FROM distributors AS d 
LEFT JOIN specs as s
ON s.domestic_distributor_id = d.distributor_id
INNER JOIN revenue as r
USING(movie_id)
GROUP BY (d.company_name)
ORDER BY avg_budget DESC
LIMIT 5;


--Question 6
SELECT s.film_title, s.domestic_distributor_id, r.imdb_rating
FROM distributors AS d
LEFT JOIN specs AS s
ON d.distributor_id = s.domestic_distributor_id 
LEFT JOIN rating as r
USING(movie_id)
WHERE d.headquarters NOT LIKE '%CA%'
ORDER BY r.imdb_rating DESC;
--Only 2 movies not distributed by CA-based companies.
--Dirty Dancing has the highest IMDB rating


--Question 7
SELECT 
	CASE WHEN length_in_min >=0 AND length_in_min <=120 THEN 'Under 2 Hours' 
	ELSE 'Over 2 Hours'
	END AS length_range, 
	AVG(r.imdb_rating) as avg_rating
FROM specs as s
LEFT JOIN rating as r
USING(movie_id)
GROUP BY length_range
ORDER BY avg_rating DESC;
--Movies over 2 hours have a higher average rating



