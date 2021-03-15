/*
 * Management is planning on purchasing new inventory.
 * Films with special features cost more to purchase than films without special features,
 * and so management wants to know if the addition of special features impacts revenue from movies.
 *
 * Write a query that for each special_feature, calculates the total profit of all movies rented with that special feature.
 *
 * HINT:
 * Start with the query you created in pagila-hw1 problem 16, but add the special_features column to the output.
 * Use this query as a subquery in a select statement similar to answer to the previous problem.
 */



SELECT
sub.special_feature,
SUM(profit) as profit
FROM (
    SELECT
        SUM(p.amount) as profit,
        unnest(f.special_features) as special_feature
        FROM film f
        INNER JOIN inventory i USING (film_id)
        INNER JOIN rental r USING (inventory_id)
        INNER JOIN payment p USING (rental_id)
        GROUP BY special_feature
        ORDER BY profit DESC) AS sub
GROUP BY sub.special_feature
ORDER BY special_feature ASC
