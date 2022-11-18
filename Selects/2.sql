SELECT "Tasks".task_name,
       "Tasks".message,
       "Projects".project_name,
       "Appointments".workload_percentage
FROM "Tasks",
     "Programmers",
     "Projects",
     "Appointments"
WHERE "Programmers".surname = 'Сидоров'
    AND "Programmers".name = 'Павел'
    AND "Programmers".fathername = 'Семенович'
    AND "Appointments".programmer_id = "Programmers".programmer_id
    AND "Appointments".task_id = "Tasks".task_id
    AND "Tasks".when_finishes > '2002-12-20'
    AND "Tasks".project_id = "Projects".project_id
ORDER BY "Projects".project_name,
         "Tasks".task_name,
         "Appointments".workload_percentage