SELECT
    w.id,
    wp.age,
    w2.coins_needed,
    w.power
FROM
    Wands w
    JOIN (
        SELECT
            code,
            MIN(coins_needed) AS coins_needed,
            power
        FROM
            Wands
        GROUP BY
            code,
            power
    ) AS w2 ON w2.code = w.code
    AND w2.coins_needed = w.coins_needed
    JOIN Wands_Property AS wp ON wp.code = w.code
WHERE
    wp.is_evil = 0
ORDER BY
    w.power DESC,
    wp.age DESC