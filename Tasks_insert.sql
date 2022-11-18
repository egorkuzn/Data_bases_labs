INSERT INTO "Tasks" (task_id, task_name, message, when_starts, when_finishes, task_percentage_status, project_id)
VALUES (1, 'Требования', 'Согласовать и описать требования', '2002-12-15',	'2002-12-25', 80, 1),
       (2, 'Проект БД', 'Разработать структуру БД', '2002-12-19', '2003-01-15', 13, 1),
       (3, 'Интерфейсы', 'Разработать описание интерфейсов', '2002-12-19', '2003-01-15', 5,	1),
       (4, 'Модуль 1', 'Реализовать модуль 1', '2003-01-15', '2003-02-25', 0, 1),
       (5, 'Модуль 2', 'Реализовать модуль 2', '2003-01-25', '2003-08-15', 0, 1),
       (6, 'Перепроектирование', 'Перепроектировать базу данных', '2002-12-18', '2003-01-18', 35, 4),
       (7, 'Интеграция', 'Интегрировать все модули', '2002-10-15', '2002-11-15', 100, 5),
       (8, 'Комплексное тестирование', 'Протестировать систему полностью', '2002-11-15', '2002-12-15', 100, 5);