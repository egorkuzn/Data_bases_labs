SELECT P.project_name,
       DATE_PART('days', P.when_finished::timestamp - P.when_started::timestamp) * 24 planned_time_spent,
       M.surname,
       M.name,
       M.fathername,
       COUNT(P.project_id) active_programmers_count
FROM "Appointments"
JOIN "Tasks" T on T.task_id = "Appointments".task_id
JOIN "Projects" P on T.project_id = P.project_id
JOIN "Managers" M on P.manager_id = M.human_id
GROUP BY P.project_id, M.surname, DATE_PART('days', P.when_finished::timestamp - P.when_started::timestamp) * 24, P.project_name, M.name, M.fathername
