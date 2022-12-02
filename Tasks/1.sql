SELECT DISTINCT "Programmers".surname as surname,
                "Programmers".name as name,
                "Programmers".fathername as fathername
FROM "Programmers",
     "Managers",
     "Appointments",
     "Tasks",
     "Projects"
WHERE "Programmers".specialization = 'C++'
  AND "Managers".surname = 'Иванов'
  AND "Managers".name = 'Петр'
  AND "Managers".fathername = 'Сергеевич'
  AND "Projects".project_id = "Tasks".project_id
  AND "Appointments".task_id = "Tasks".task_id
  AND "Appointments".programmer_id = "Programmers".programmer_id
ORDER BY "Programmers".surname,
         "Programmers".name,
         "Programmers".fathername;