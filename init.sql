create table homework
(
    id   integer generated always as identity
        constraint "Homework_pkey"
            primary key,
    name        varchar not null,
    description varchar not null
);

alter table homework
    owner to postgres;

create table lesson
(
    id          integer generated always as identity
        constraint pk_lesson
            primary key,
    name        varchar                        not null,
    updatedat   time default CURRENT_TIMESTAMP not null,
    homework_id integer                        not null
        constraint fk_homework_id
            references homework
);

alter table lesson
    owner to postgres;

create table schedule
(
    id        integer generated always as identity
        constraint pk_schedule
            primary key,
    name      varchar                        not null,
    updatedat time default CURRENT_TIMESTAMP not null,
    lessons   varchar                        not null
);

alter table schedule
    owner to postgres;

create table schedule_lessons
(
    schedule_id integer not null
        constraint "fk_Schedule_id"
            references schedule,
    lesson_id   integer not null
        constraint "fk_Lesson_id"
            references lesson,
    constraint "pk_Schedule_Lessons"
        primary key (schedule_id, lesson_id)
);

alter table schedule_lessons
    owner to postgres;


