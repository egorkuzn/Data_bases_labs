SELECT P.project_name,
       P.when_started,
       P.when_finished,
       DATE_PART('days', P.when_finished::timestamp - P.when_started::timestamp) * 24 planned_time_spent,
       SUM(DATE_PART('days', T.when_finishes::timestamp - T.when_starts::timestamp)) * 24 fact_time_spent
FROM (  SELECT P.project_id
        FROM (SELECT DISTINCT project_id,
                        COUNT(project_id) as count
                FROM "Tasks"
                WHERE (task_percentage_status != 100
                    OR when_finishes >= '2003-01-01'::DATE)
                GROUP BY project_id) as "Out year"
        LEFT JOIN "Projects" as P on "Out year".project_id = P.project_id
        WHERE "Out year".count IS NULL) as "In time"
JOIN "Tasks" T on "In time".project_id = T.project_id
INNER JOIN "Projects" P on T.project_id = P.project_id
WHERE P.manager_id = (SELECT human_id
                      FROM "Managers"
                      WHERE surname = 'Оракулов'
                        AND name = 'Николай'
                        AND fathername = 'Иванович')
GROUP BY P.project_id, DATE_PART('days', P.when_finished::timestamp - P.when_started::timestamp)
ORDER BY DATE_PART('days', P.when_finished::timestamp - P.when_started::timestamp) DESC;


