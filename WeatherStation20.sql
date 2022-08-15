SELECT
    round(t.lat_n, 4)
FROM
    (
        SELECT
            *,
            row_number() over (
                ORDER BY
                    lat_n DESC
            ) AS row_
        FROM
            station
    ) AS t
WHERE
    t.row_ = (
        SELECT
            CASE
                WHEN max(row_n) % 2 = 0 THEN max(row_n) / 2
                ELSE (max(row_n) + 1) / 2
            END AS row_value
        FROM
            (
                SELECT
                    *,
                    row_number() over (
                        ORDER BY
                            lat_n DESC
                    ) AS row_n
                FROM
                    station
            ) AS t1
    )