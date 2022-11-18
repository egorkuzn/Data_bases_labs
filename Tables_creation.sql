CREATE TABLE "Managers"
(
    human_id   SERIAL PRIMARY KEY,
    name       varchar(35) NOT NULL CHECK ( length(name) > 0 ),
    surname    varchar(35) NOT NULL CHECK ( length(surname) > 0 ),
    fathername varchar(35)
);

CREATE TABLE "Projects"
(
    project_id    SERIAL PRIMARY KEY,
    project_name  TEXT NOT NULL,
    when_started  DATE NOT NULL,
    when_finished DATE NOT NULL CHECK ( when_finished > when_started ),
    manager_id    INTEGER,

    FOREIGN KEY (manager_id) REFERENCES "Managers"
);

CREATE TABLE "Programmers"
(
    programmer_id  SERIAL PRIMARY KEY,
    name           varchar(35)  NOT NULL CHECK ( length(name) > 0 ),
    surname        varchar(35)  NOT NULL CHECK ( length(surname) > 0 ),
    fathername     varchar(35),
    specialization varchar(100) NOT NULL
);

CREATE TABLE "Tasks"
(
    task_id                SERIAL PRIMARY KEY,
    task_name              varchar(100) NOT NULL,
    message                TEXT NOT NULL,
    when_starts            DATE NOT NULL,
    when_finishes          DATE NOT NULL CHECK(when_finishes > when_starts),
    task_percentage_status SMALLINT CHECK (
            (task_percentage_status >= 0)
            AND (task_percentage_status <= 100)
        ),
    project_id INTEGER NOT NULL,

    FOREIGN KEY (project_id) REFERENCES "Projects"
);

CREATE TABLE "Appointments"
(
    programmer_id INTEGER NOT NULL,
    task_id       INTEGER NOT NULL,
    workload_percentage SMALLINT CHECK (
            (workload_percentage >= 0)
            AND (workload_percentage <= 100)
        ),

    FOREIGN KEY (programmer_id) REFERENCES "Programmers",
    FOREIGN KEY (task_id) REFERENCES "Tasks"
);