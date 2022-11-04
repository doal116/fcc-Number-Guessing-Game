--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: user_details; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_details (
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.user_details OWNER TO freecodecamp;

--
-- Data for Name: user_details; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_details VALUES ('user_1667553606999', 2, 141);
INSERT INTO public.user_details VALUES ('user_1667554191017', 2, 10);
INSERT INTO public.user_details VALUES ('user_1667553607000', 5, 184);
INSERT INTO public.user_details VALUES ('user_1667554191018', 5, 322);
INSERT INTO public.user_details VALUES ('alex', 1, 12);
INSERT INTO public.user_details VALUES ('user_1667553931242', 2, 347);
INSERT INTO public.user_details VALUES ('user_1667553931243', 5, 325);
INSERT INTO public.user_details VALUES ('user_1667554354503', 2, 47);
INSERT INTO public.user_details VALUES ('user_1667553935172', 2, 437);
INSERT INTO public.user_details VALUES ('user_1667554354504', 5, 108);
INSERT INTO public.user_details VALUES ('user_1667553935173', 5, 358);
INSERT INTO public.user_details VALUES ('user_1667553986071', 2, 223);
INSERT INTO public.user_details VALUES ('user_1667553986072', 5, 36);
INSERT INTO public.user_details VALUES ('user_1667554061754', 2, 321);
INSERT INTO public.user_details VALUES ('user_1667554061755', 5, 127);


--
-- PostgreSQL database dump complete
--

