SELECT DISTINCT "Programmers".surname as surname,
                "Programmers".name as name,
                "Programmers".fathername as fathername
FROM "Programmers",
     "Managers"
WHERE specialization = 'C++'
  AND "Managers".surname = 'Иванов'
  AND "Managers".name = 'Петр'
  AND "Managers".fathername = 'Сергеевич'
ORDER BY "Programmers".surname,
         "Programmers".name,
         "Programmers".fathername;