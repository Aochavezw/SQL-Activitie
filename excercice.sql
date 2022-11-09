-- this is a comment
--.schema -> despliega el esquema de la base de datos
--.databases -> despliega las BD conectadas junto con su ubicación

--PARTE 1

--1.1
SELECT first_name, last_name
FROM actor;

--1.2
SELECT 
UPPER(first_name)|| ' ' || UPPER(last_name) AS 'Actor Name'
FROM actor;

--1.3
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name LIKE 'JOE';

--1.4
SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name LIKE '%GEN%';

--1.5
SELECT actor_id, last_name, first_name
FROM actor
WHERE last_name LIKE '%LI%'
ORDER BY last_name  ASC, first_name ASC;

--1.6
SELECT country_id, country
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');x

--PARTE 2

--2.1
SELECT  last_name, count(last_name) AS last_name_counter
FROM actor
GROUP BY last_name
HAVING count(last_name);


--2.2
SELECT  last_name, count(last_name) AS last_name_counter
FROM actor
GROUP BY last_name
HAVING count(last_name)>1;

--2.3
SELECT st.staff_id, st.first_name, st.last_name, st.address_id, ad.address
FROM staff st
INNER JOIN address ad
ON st.address_id=ad.address_id;

--2.4
SELECT st.first_name, round(sum(p.amount),2) AS TAmaunt
FROM staff st
LEFT JOIN payment p
ON st.staff_id=p.staff_id
GROUP BY st.first_name;

--2.5
SELECT f.title, count(ac.first_name || ' ' || ac.last_name) AS 'Actor Name'
FROM film f
INNER JOIN film_actor fa on f.film_id=fa.film_id
INNER JOIN actor ac on fa.actor_id=ac.actor_id
GROUP BY f.title;

--2.6
SELECT f.film_id AS ID, f.title, count(f.film_id) AS number_of_copies
FROM film f
INNER JOIN inventory i on f.film_id=i.film_id
WHERE f.title='HUNCHBACK IMPOSSIBLE'
GROUP BY f.title;

--2.7
SELECT c.customer_id, c.last_name || ' ' || c.first_name  AS customer_name, round(sum(p.amount),2) AS TAmaunt
FROM customer c
LEFT JOIN payment p
ON c.customer_id=p.customer_id
GROUP BY customer_name
ORDER BY customer_name;


--PARTE 3

SELECT title
FROM film
WHERE title LIKE 'Q%' AND (SELECT language_id FROM language WHERE language_id=1);


SELECT fi.title, ac.first_name, ac.last_name
FROM actor ac
INNER JOIN film_actor fa ON ac.actor_id=fa.actor_id
INNER JOIN film fi ON fi.film_id=fa.film_id
WHERE fi.title in (SELECT fi.title FROM film WHERE fi.title='ALONE TRIP');

SELECT c.country cu.first_name, cu.last_name cu.email
FROM customer
INNER JOIN address ad on cu.address_id=ad.address_id
INNER JOIN city ON ad.city_id=city.city_id
INNER JOIN country c on city.country_id=c.country_id
WHERE c.country='Canada';








