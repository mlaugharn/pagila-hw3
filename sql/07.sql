/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSEL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */

SELECT
    DISTINCT a3.first_name || ' ' || a3.last_name as "Actor Name"
    FROM(
           SELECT
				DISTINCT a2.actor_id
				FROM actor a1
				JOIN film_actor fa1 ON a1.actor_id = fa1.actor_id
				JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
				JOIN actor a2 ON fa2.actor_id = a2.actor_id
				WHERE
					a1.actor_id = 112 AND a2.actor_id != 112
		)  a2
    JOIN film_actor fa2 ON a2.actor_id = fa2.actor_id
    JOIN film_actor fa3 ON fa2.film_id = fa3.film_id
    JOIN actor a3 ON fa3.actor_id = a3.actor_id
    WHERE
        a2.actor_id != 112 AND
        a3.actor_id != 112 AND
        a3.actor_id NOT IN(
        SELECT
            DISTINCT a2.actor_id
            FROM actor a1
            JOIN film_actor fa1 ON a1.actor_id = fa1.actor_id
            JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
            JOIN actor a2 ON fa2.actor_id = a2.actor_id
            WHERE
                a1.actor_id = 112 AND a2.actor_id != 112
        )
    ORDER BY "Actor Name"
