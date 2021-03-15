/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */


SELECT 
    bts.title
    FROM
        (SELECT
            title,
            film_id,
            unnest(special_features)
            FROM film
        ) bts
     INNER JOIN
        (SELECT
            title,
            film_id,
            unnest(special_features)
            FROM film
        ) trailers
      USING (film_id)
    WHERE bts.unnest = 'Behind the Scenes'
    AND trailers.unnest = 'Trailers'
    ORDER BY bts.title ASC
