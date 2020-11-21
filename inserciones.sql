/*Inserciones de las tablas del conjunto de datos mlb_pitch_data para PostgeSQL.
Fuente Original: https://www.kaggle.com/pschale/mlb-pitch-data-20152018
Presentado por: Juan Ángel y José Martínez
Barcamp 2020, Santiago.*/

-- Table: public.atbats

-- DROP TABLE public.atbats;

CREATE TABLE public.atbats
(
    ab_id double precision NOT NULL,
    batter_id numeric NOT NULL,
    event text COLLATE pg_catalog."default",
    g_id double precision NOT NULL,
    inning integer,
    out_r integer,
    pitcher_t_score integer,
    p_throws text COLLATE pg_catalog."default",
    pitcher_id numeric NOT NULL,
    stand character(1) COLLATE pg_catalog."default",
    top_inning boolean,
    CONSTRAINT atbats_pkey PRIMARY KEY (ab_id),
    CONSTRAINT atbats_batter_id_fkey FOREIGN KEY (batter_id)
        REFERENCES public.player_name (player_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT atbats_g_id_fkey FOREIGN KEY (g_id)
        REFERENCES public.games (g_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT atbats_pitcher_id_fkey FOREIGN KEY (pitcher_id)
        REFERENCES public.player_name (player_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.atbats
    OWNER to postgres;

-- Table: public.games

-- DROP TABLE public.games;

CREATE TABLE public.games
(
    attendance bigint,
    away_final_score integer,
    away_team text COLLATE pg_catalog."default",
    game_date date,
    elapsed_time_min integer,
    g_id double precision NOT NULL,
    home_final_score integer,
    home_team text COLLATE pg_catalog."default",
    start_time time without time zone,
    umpire_hp text COLLATE pg_catalog."default",
    venue_name text COLLATE pg_catalog."default",
    weather text COLLATE pg_catalog."default",
    wind text COLLATE pg_catalog."default",
    delay_min integer,
    CONSTRAINT games_pkey PRIMARY KEY (g_id)
)

TABLESPACE pg_default;

ALTER TABLE public.games
    OWNER to postgres;

-- Table: public.pitches

-- DROP TABLE public.pitches;

CREATE TABLE public.pitches
(
    ab_id double precision NOT NULL,
    ball_count integer,
    current_team_score text COLLATE pg_catalog."default",
    break_angle double precision,
    break_lengh double precision,
    pitch_code text COLLATE pg_catalog."default",
    nasty integer,
    on_1b boolean,
    on_2b boolean,
    on_3b boolean,
    outs integer,
    pitch_num integer,
    pitch_type text COLLATE pg_catalog."default",
    strike_count integer,
    spin_rate double precision,
    start_speed double precision,
    end_speed double precision,
    result_of_pitch character(1) COLLATE pg_catalog."default",
    CONSTRAINT pitches_ab_id_fkey FOREIGN KEY (ab_id)
        REFERENCES public.atbats (ab_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.pitches
    OWNER to postgres;

-- Table: public.player_name

-- DROP TABLE public.player_name;

CREATE TABLE public.player_name
(
    player_id numeric NOT NULL,
    first_name text COLLATE pg_catalog."default",
    last_name text COLLATE pg_catalog."default",
    CONSTRAINT player_name_pkey PRIMARY KEY (player_id)
)

TABLESPACE pg_default;

ALTER TABLE public.player_name
    OWNER to postgres;

