--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    number_of_guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'tea');
INSERT INTO public.users VALUES (2, 'user_1727289040247');
INSERT INTO public.users VALUES (3, 'user_1727289040246');
INSERT INTO public.users VALUES (4, 'user_1727289135118');
INSERT INTO public.users VALUES (5, 'user_1727289135117');
INSERT INTO public.users VALUES (6, 'user_1727289165702');
INSERT INTO public.users VALUES (7, 'user_1727289165701');
INSERT INTO public.users VALUES (8, 'user_1727289359168');
INSERT INTO public.users VALUES (9, 'user_1727289359167');
INSERT INTO public.users VALUES (10, 'user_1727289404541');
INSERT INTO public.users VALUES (11, 'user_1727289404540');
INSERT INTO public.users VALUES (12, 'TEA');
INSERT INTO public.users VALUES (13, 'user_1727289635605');
INSERT INTO public.users VALUES (14, 'user_1727289635604');
INSERT INTO public.users VALUES (15, 'user_1727290605347');
INSERT INTO public.users VALUES (16, 'user_1727290605346');
INSERT INTO public.users VALUES (17, 'user_1727290791840');
INSERT INTO public.users VALUES (18, 'user_1727290791839');
INSERT INTO public.users VALUES (19, 'user_1727290826237');
INSERT INTO public.users VALUES (20, 'user_1727290826236');
INSERT INTO public.users VALUES (21, 'user_1727290852971');
INSERT INTO public.users VALUES (22, 'user_1727290852970');
INSERT INTO public.users VALUES (23, 'user_1727290986787');
INSERT INTO public.users VALUES (24, 'user_1727290986786');
INSERT INTO public.users VALUES (25, 'user_1727291081796');
INSERT INTO public.users VALUES (26, 'user_1727291081795');
INSERT INTO public.users VALUES (27, 'user_1727291263747');
INSERT INTO public.users VALUES (28, 'user_1727291263746');
INSERT INTO public.users VALUES (29, 'user_1727291273005');
INSERT INTO public.users VALUES (30, 'user_1727291273004');
INSERT INTO public.users VALUES (31, 'user_1727291391446');
INSERT INTO public.users VALUES (32, 'user_1727291391445');
INSERT INTO public.users VALUES (33, 'user_1727291451136');
INSERT INTO public.users VALUES (34, 'user_1727291451135');
INSERT INTO public.users VALUES (35, 'user_1727291655078');
INSERT INTO public.users VALUES (36, 'user_1727291655077');
INSERT INTO public.users VALUES (37, 'user_1727292086673');
INSERT INTO public.users VALUES (38, 'user_1727292086672');
INSERT INTO public.users VALUES (39, 'user_1727292244552');
INSERT INTO public.users VALUES (40, 'user_1727292244551');
INSERT INTO public.users VALUES (41, 'user_1727292310886');
INSERT INTO public.users VALUES (42, 'user_1727292310885');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 42, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

