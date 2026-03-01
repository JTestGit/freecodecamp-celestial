--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    description text,
    has_life boolean,
    is_visible boolean,
    age_in_millions_of_years integer,
    galaxy_types character varying(50),
    distance_between_galaxy numeric(15,2),
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: i_exist; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.i_exist (
    i_exist_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    "exists" boolean
);


ALTER TABLE public.i_exist OWNER TO freecodecamp;

--
-- Name: i_exist_exist_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.i_exist_exist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.i_exist_exist_id_seq OWNER TO freecodecamp;

--
-- Name: i_exist_exist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.i_exist_exist_id_seq OWNED BY public.i_exist.i_exist_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_visible boolean,
    age_in_millions_of_years integer,
    part_of character varying(50),
    mass numeric(15,2),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_visible boolean,
    age_in_millions_of_years integer,
    planet_types character varying(50),
    mass numeric(15,2),
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_visible boolean,
    age_in_millions_of_years integer,
    star_types character varying(50),
    mass numeric(15,2),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: i_exist i_exist_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.i_exist ALTER COLUMN i_exist_id SET DEFAULT nextval('public.i_exist_exist_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (description, has_life, is_visible, age_in_millions_of_years, galaxy_types, distance_between_galaxy, name, galaxy_id) FROM stdin;
Our home galaxy	t	t	13600	Spiral	0.00	Milky Way	1
Nearest large galaxy	f	t	10000	Spiral	2537000.00	Andromeda	2
Smaller neighboring galaxy	f	t	12000	Spiral	3000000.00	Triangulum	3
Bright bulge galaxy	f	t	13000	Spiral	29000000.00	Sombrero	7
Famous interacting galaxy	f	t	11000	Spiral	23000000.00	Whirlpool	8
Face-on spiral	f	t	10000	Spiral	21000000.00	Pinwheel	9
\.


--
-- Data for Name: i_exist; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.i_exist (i_exist_id, name, description, "exists") FROM stdin;
1	Bijay	J	t
2	Jerry	bJ	f
3	BJAY	BJAY	f
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, name, description, has_life, is_visible, age_in_millions_of_years, part_of, mass, planet_id) FROM stdin;
1	Moon	Natural satellite of Earth	f	t	4500	Earth	0.01	1
2	Proxima b I	Hypothetical moon of Proxima b	f	f	500	Proxima b	0.01	2
3	Triangulum Minor	Moon of Triangulum-1	f	t	800	Triangulum-1	0.50	3
5	Phobos	Mars moon	f	t	4500	Mars	0.00	2
6	Deimos	Mars moon	f	t	4500	Mars	0.00	2
10	Titan	Saturn moon	f	t	4500	Saturn	0.02	5
11	Rhea	Saturn moon	f	t	4500	Saturn	0.01	5
12	Iapetus	Saturn moon	f	t	4500	Saturn	0.00	5
13	Enceladus	Saturn moon	f	t	4500	Saturn	0.00	5
15	Alpha Cen Bb I	Alpha Cen Bb moon	f	t	100	Alpha Cen Bb	7.00	7
16	Sirius-1a	Sirius-1 moon	f	t	50	Sirius-1	10.00	8
18	Betelgeuse-1a	Betelgeuse moon	f	t	300	Betelgeuse-1	6.00	10
24	Ganymede	Largest moon of Jupiter	f	t	4500	Jupiter	0.03	7
25	Callisto	Second largest moon of Jupiter	f	t	4500	Jupiter	0.02	7
26	Europa	Icy moon of Jupiter	f	t	4500	Jupiter	0.01	7
27	Oberon	Moon of Uranus	f	t	4500	Uranus	0.01	14
28	Titania	Moon of Uranus	f	t	4500	Uranus	0.01	14
29	Triton	Moon of Neptune	f	t	4500	Neptune	0.02	16
30	Kepler-22b I	Moon of Kepler-22b	f	f	4000	Kepler-22b	0.01	15
31	Kepler-22b II	Second moon of Kepler-22b	f	f	4000	Kepler-22b	0.01	15
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, name, description, has_life, is_visible, age_in_millions_of_years, planet_types, mass, star_id) FROM stdin;
1	Earth	Our home planet	t	t	4500	Terrestrial	1.00	1
2	Proxima b	Exoplanet around Proxima Centauri	f	f	1000	Terrestrial	0.01	2
3	Triangulum-1	Planet in Triangulum galaxy	f	t	2000	Gas Giant	300.00	3
5	Mars	Red planet	f	t	4500	Terrestrial	0.11	1
6	Venus	Hot planet	f	t	4500	Terrestrial	0.82	1
7	Jupiter	Gas giant	f	t	4500	Gas Giant	318.00	1
8	Saturn	Ringed planet	f	t	4500	Gas Giant	95.00	1
10	Alpha Cen Bb	Exoplanet	f	f	1200	Terrestrial	1.10	3
14	Rigel-1	Exoplanet	f	t	3500	Gas Giant	4.50	6
15	Triangulum-1a	Exoplanet	f	t	2000	Terrestrial	2.00	3
16	Neptune	Ice giant	f	t	4500	Gas Giant	17.00	1
17	Kepler-22b	Potentially habitable exoplanet	f	f	4000	Terrestrial	2.40	2
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, name, description, has_life, is_visible, age_in_millions_of_years, star_types, mass, galaxy_id) FROM stdin;
1	Sun	Our central star	t	t	4600	G-type	1.00	1
2	Proxima Centauri	Closest star to the Sun	f	t	4500	M-type	0.12	2
3	Triangulum A	Bright star in Triangulum galaxy	f	t	5000	B-type	2.50	3
6	Alpha Centauri A	Binary star in Centauri	f	t	5000	G-type	1.10	2
7	Sirius	Brightest star	f	t	242	A-type	2.02	1
8	Betelgeuse	Red supergiant	f	t	8000	M-type	20.00	1
9	Rigel	Blue supergiant	f	t	8000	B-type	21.00	1
\.


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: i_exist_exist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.i_exist_exist_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 31, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: i_exist i_exist_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.i_exist
    ADD CONSTRAINT i_exist_pkey PRIMARY KEY (i_exist_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: i_exist unique_exist_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.i_exist
    ADD CONSTRAINT unique_exist_name UNIQUE (name);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

