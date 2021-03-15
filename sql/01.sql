/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 */

SELECT 
    title
    FROM film
    WHERE rating = 'G' and (title, 'Trailers') in (SELECT title, unnest(special_features) FROM film)
    ORDER BY title DESC
