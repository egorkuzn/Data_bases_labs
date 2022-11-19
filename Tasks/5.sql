UPDATE "Tasks"
SET task_percentage_status = 100
FROM "Projects"
WHERE "Projects".when_finished <= '2003-12-31'::date