/*
 * Count the number of movies that contain each type of special feature.
 */

SELECT
    unnest(special_features) as special_features,
    count(*)
    FROM film
    GROUP BY unnest(special_features)
    ORDER BY special_features ASC
