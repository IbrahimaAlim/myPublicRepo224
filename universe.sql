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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_in_solar_mass numeric(30,3),
    radius_in_light_year integer NOT NULL,
    is_spherical boolean,
    description text
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    mass_in_kg numeric(30,3),
    radius_in_km integer NOT NULL,
    has_atmosphere boolean,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    mass_in_kg numeric(30,3),
    distance_from_earth_km integer NOT NULL,
    is_visible_to_naked_eye boolean,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    mass_in_solar_mass numeric(30,3),
    diameter_in_km integer NOT NULL,
    has_life boolean,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: structure; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.structure (
    structure_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.structure OWNER TO freecodecamp;

--
-- Name: structure_structure_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.structure_structure_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.structure_structure_id_seq OWNER TO freecodecamp;

--
-- Name: structure_structure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.structure_structure_id_seq OWNED BY public.structure.structure_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: structure structure_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.structure ALTER COLUMN structure_id SET DEFAULT nextval('public.structure_structure_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1512.000, 100000, true, 'Our home galaxy.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1012.000, 220000, true, 'Closest spiral galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 5011.000, 60000, true, 'A member of the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 3011.000, 80000, true, 'Known for its distinctive spiral arms.');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 8010.000, 50000, true, 'Named for its resemblance to a sombrero hat.');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 1011.000, 170000, true, 'A face-on spiral galaxy.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 73522.000, 1737, false, 'Earth only natural satellite.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 10616.000, 11, false, 'A moon of Mars.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 14815.000, 6, false, 'A moon of Mars.');
INSERT INTO public.moon VALUES (4, 'Io', 5, 89322.000, 1821, false, 'A moon of Jupiter.');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 4822.000, 1560, false, 'A moon of Jupiter.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 14823.000, 2634, false, 'A moon of Jupiter.');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 10823.000, 2410, false, 'A moon of Jupiter.');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 13523.000, 2575, true, 'A moon of Saturn.');
INSERT INTO public.moon VALUES (21, 'Rhea', 6, 23121.000, 763, false, 'A moon of Saturn.');
INSERT INTO public.moon VALUES (22, 'Iapetus', 6, 18121.000, 734, false, 'A moon of Saturn.');
INSERT INTO public.moon VALUES (23, 'Dione', 6, 1121.000, 561, false, 'A moon of Saturn.');
INSERT INTO public.moon VALUES (24, 'Tethys', 6, 61720.000, 531, false, 'A moon of Saturn.');
INSERT INTO public.moon VALUES (25, 'Enceladus', 6, 10820.000, 252, false, 'A moon of Saturn.');
INSERT INTO public.moon VALUES (26, 'Miranda', 7, 65919.000, 235, false, 'A moon of Uranus.');
INSERT INTO public.moon VALUES (27, 'Ariel', 7, 12921.000, 579, false, 'A moon of Uranus.');
INSERT INTO public.moon VALUES (28, 'Umbriel', 7, 11721.000, 584, false, 'A moon of Uranus.');
INSERT INTO public.moon VALUES (29, 'Titania', 7, 34921.000, 789, false, 'A moon of Uranus.');
INSERT INTO public.moon VALUES (30, 'Oberon', 7, 30121.000, 761, false, 'A moon of Uranus.');
INSERT INTO public.moon VALUES (31, 'Triton', 8, 21422.000, 1353, true, 'A moon of Neptune.');
INSERT INTO public.moon VALUES (32, 'Nereid', 8, 3119.000, 170, false, 'A moon of Neptune.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 328523.000, 91700, true, 'The smallest planet in the Solar System.');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 486724.000, 41400, true, 'The second planet from the Sun.');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 597224.000, 0, true, 'Our home planet.');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 63923.000, 78300, true, 'The red planet.');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 189827.000, 628730, true, 'The largest planet in the Solar System.');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 568326.000, 1275000, true, 'Known for its extensive ring system.');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 868125.000, 272395, false, 'An ice giant with a tilted axis.');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 102426.000, 4351400, false, 'The farthest known planet from the Sun.');
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 12725.000, 42413, false, 'An exoplanet orbiting Proxima Centauri.');
INSERT INTO public.planet VALUES (10, 'Vulcan', 3, 46724.000, 2511, false, 'A hypothetical planet in the Solar System.');
INSERT INTO public.planet VALUES (11, 'Planet X', 2, 71226.000, 6012, false, 'A hypothetical planet beyond Neptune.');
INSERT INTO public.planet VALUES (12, 'Alpha Centauri Bb', 2, 1225.000, 4313, false, 'An exoplanet orbiting Alpha Centauri B.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.000, 1392000, true, 'The star at the center of our solar system.');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 0.123, 200000, false, 'The closest known star to the Sun.');
INSERT INTO public.star VALUES (3, 'Sirius', 1, 2.063, 2396000, false, 'The brightest star in the night sky.');
INSERT INTO public.star VALUES (4, 'Vega', 2, 2.135, 2464000, false, 'A bright star in the constellation Lyra.');
INSERT INTO public.star VALUES (5, 'Rigel', 3, 21.000, 69942000, false, 'A blue supergiant star in the Orion constellation.');
INSERT INTO public.star VALUES (6, 'Betelgeuse', 1, 20.000, 88722000, false, 'A red supergiant star in the Orion constellation.');


--
-- Data for Name: structure; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.structure VALUES (1, 'Space Station', 'Artificial', 'An artificial structure designed for humans to live and work in outer space.');
INSERT INTO public.structure VALUES (2, 'Satellite', 'Artificial', 'An artificial body placed in orbit around the earth or moon or another planet.');
INSERT INTO public.structure VALUES (3, 'Asteroid Belt', 'Natural', 'A region of the Solar System located roughly between the orbits of the planets Mars and Jupiter.');
INSERT INTO public.structure VALUES (4, 'Comet', 'Natural', 'A celestial object consisting of a nucleus of ice and dust.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 32, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: structure_structure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.structure_structure_id_seq', 4, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: structure structure_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.structure
    ADD CONSTRAINT structure_name_key UNIQUE (name);


--
-- Name: structure structure_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.structure
    ADD CONSTRAINT structure_pkey PRIMARY KEY (structure_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

