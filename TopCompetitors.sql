SELECT
    s.hacker_id,
    h.name
FROM
    Hackers h
    JOIN Submissions s ON s.hacker_id = h.hacker_id
    JOIN Challenges c ON c.challenge_id = s.challenge_id
    JOIN Difficulty d ON d.difficulty_level = c.difficulty_level
WHERE
    s.score = d.score
GROUP BY
    s.hacker_id,
    h.name
HAVING
    count(s.hacker_id) > 1
ORDER BY
    count(s.hacker_id) DESC,
    s.hacker_id