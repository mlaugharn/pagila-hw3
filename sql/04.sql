/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT
    first_name || ' ' || last_name as "Actor Name"
    FROM actor
    JOIN film_actor USING (actor_id)
    JOIN film USING (film_id)
    WHERE (title, 'Behind the Scenes') in (
        SELECT
            title,
            unnest(special_features)
            FROM film)
    GROUP BY "Actor Name"
    ORDER BY "Actor Name"
