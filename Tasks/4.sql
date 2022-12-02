SELECT ProjectStaticView.project_name,
       ProjectStaticView.planned_time,
       ProjectStaticView.surname,
       ProjectStaticView.name,
       ProjectStaticView.fathername,
       ProjectProgrammersCount.prog_count
FROM (SELECT P.project_id,
            COUNT(DISTINCT A.programmer_id) as prog_count
      FROM "Appointments" as A
               INNER JOIN "Tasks" on "Tasks".task_id = A.task_id
               LEFT JOIN "Projects" as P on "Tasks".project_id = P.project_id
      GROUP BY P.project_id) as ProjectProgrammersCount RIGHT JOIN (
          SELECT P.project_id,
                P.project_name,
                DATE_PART('days', P.when_finished::timestamp - P.when_started::timestamp) * 24 planned_time,
                M.surname,
                M.name,
                M.fathername
        FROM "Projects" as P LEFT JOIN "Managers" M on M.human_id = P.manager_id
     ) as ProjectStaticView on ProjectStaticView.project_id = ProjectProgrammersCount.project_id;

-- вывести менеджера на проектах у которого самый высокий процент выполнения задач
SELECT DISTINCT P.project_name,
                DATE_PART('days', P.when_finished::timestamp - P.when_started::timestamp) * 24 planned_time_spent,
                M.surname,
                M.name,
                M.fathername,
                count(P.project_name)
FROM "Projects" as P,
     "Tasks" as T,
     "Managers" as M
JOIN "Appointments" as A on T.task_id = A.task_id
WHERE P.project_id = T.project_id
    AND M.human_id = P.manager_id
GROUP BY P.project_name,
         M.surname,
         DATE_PART('days', P.when_finished::timestamp - P.when_started::timestamp) * 24,
         P.project_name,
         M.name,
         M.fathername
ORDER BY P.project_name;
