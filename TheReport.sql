SELECT
    IF(Grade > 7, Name, NULL),
    Grade,
    Marks
FROM
    (
        SELECT
            Name,
            (
                SELECT
                    grade
                FROM
                    grades
                WHERE
                    Students.Marks BETWEEN Grades.Min_Mark
                    AND Grades.Max_Mark
            ) AS Grade,
            Marks
        FROM
            Students
        ORDER BY
            Grade DESC,
            Name,
            Marks
    ) AS res