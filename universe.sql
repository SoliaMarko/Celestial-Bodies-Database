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
    name character varying(255) NOT NULL,
    description text,
    galaxy_types_id integer,
    has_life boolean
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    type character varying(255) NOT NULL
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    has_life boolean,
    planet_id integer,
    age_in_millions_of_years integer
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
    name character varying(255) NOT NULL,
    has_life boolean,
    age_in_millions_of_years integer,
    star_id integer
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    type character varying(255) NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(12,3) NOT NULL,
    galaxy_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'The closest major galaxy to the Milky Way', 1, true);
INSERT INTO public.galaxy VALUES (2, 'Triangulum Galaxy', 'A satellite galaxy of the Andromeda Galaxy', 4, NULL);
INSERT INTO public.galaxy VALUES (3, 'Sombrero Galaxy', 'A bright lenticular galaxy with a bright central bulge and halo', 3, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'A spectacular spiral galaxy with distinct lanes of dust', 1, true);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 'A face-on grand-design spiral galaxy', 1, NULL);
INSERT INTO public.galaxy VALUES (6, 'Virgo Cluster', 'A cluster of over 1300 galaxies located in the constellation Virgo', 7, false);
INSERT INTO public.galaxy VALUES (7, 'Milky Way', 'The galaxy that contains the solar system and Earth', 1, true);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Grand Design/Barred spiral', 'Contains prominent spiral arms that wrap all the way around with visible dust lanes. May have a bar structure at the center.', 'Spiral galaxy');
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', 'Spherical or egg-shaped with no distinct structure or dust lanes. Mostly older stars.', 'Elliptical galaxy');
INSERT INTO public.galaxy_types VALUES (3, 'Lenticular/SO', 'Intermediate between spiral and elliptical, containing a disk but no prominent spiral arms.', 'Lenticular galaxy');
INSERT INTO public.galaxy_types VALUES (4, 'Magellanic irregular', 'Unstructured, loosely clustered stars and interstellar gas. Often disturbed shapes.', 'Irregular galaxy');
INSERT INTO public.galaxy_types VALUES (5, 'Dwarf spheroidal/irregular', 'Small galaxy containing few stars. Spherical or irregular shape. Satellites of larger galaxies.', 'Dwarf galaxy');
INSERT INTO public.galaxy_types VALUES (6, 'Ring galaxy', 'Contains a massive outer ring structure formed via collision or interaction.', 'Peculiar galaxy');
INSERT INTO public.galaxy_types VALUES (7, 'Cluster', 'Tightly bound group of hundreds to thousands of galaxies held together by gravity.', 'Galaxy group/clusters');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Deimos', true, 11, 1000);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 11, 1000);
INSERT INTO public.moon VALUES (3, 'Io', true, 13, 4567);
INSERT INTO public.moon VALUES (4, 'Europa', false, 13, 4567);
INSERT INTO public.moon VALUES (5, 'Ganymede', true, 13, 4567);
INSERT INTO public.moon VALUES (6, 'Callisto', false, 13, 4567);
INSERT INTO public.moon VALUES (7, 'Titan', true, 14, 4567);
INSERT INTO public.moon VALUES (8, 'Rhea', false, 14, 4567);
INSERT INTO public.moon VALUES (9, 'Dione', true, 14, 4567);
INSERT INTO public.moon VALUES (10, 'Tethys', false, 14, 4567);
INSERT INTO public.moon VALUES (11, 'Proteus', false, 16, 4500);
INSERT INTO public.moon VALUES (12, 'Triton', true, 16, 4500);
INSERT INTO public.moon VALUES (13, 'Nereid', false, 16, 4500);
INSERT INTO public.moon VALUES (14, 'Halimede', true, 13, 4567);
INSERT INTO public.moon VALUES (15, 'Thebe', false, 13, 4567);
INSERT INTO public.moon VALUES (16, 'Amalthea', true, 13, 4567);
INSERT INTO public.moon VALUES (17, 'Himalia', false, 13, 4567);
INSERT INTO public.moon VALUES (18, 'Elara', true, 11, 4567);
INSERT INTO public.moon VALUES (19, 'Phobos II', false, 11, 1000);
INSERT INTO public.moon VALUES (20, 'Deimos II', true, 11, 1000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (10, 'Earth', true, 4567, 9);
INSERT INTO public.planet VALUES (11, 'Mars', NULL, 4567, 9);
INSERT INTO public.planet VALUES (12, 'Venus', false, 4567, 9);
INSERT INTO public.planet VALUES (13, 'Jupiter', false, 4567, 9);
INSERT INTO public.planet VALUES (14, 'Saturn', false, 4567, 9);
INSERT INTO public.planet VALUES (15, 'Uranus', false, 4567, 9);
INSERT INTO public.planet VALUES (16, 'Neptune', false, 4567, 9);
INSERT INTO public.planet VALUES (17, 'Proxima Centauri b', NULL, 4500, 11);
INSERT INTO public.planet VALUES (18, 'Sirius b', false, 250, 10);
INSERT INTO public.planet VALUES (19, 'Rigil Kentaurus b', false, 1000, 12);
INSERT INTO public.planet VALUES (20, 'Aldebaran b', false, 1320, 13);
INSERT INTO public.planet VALUES (21, 'Alpha Centauri B b', NULL, 4500, 14);
INSERT INTO public.planet VALUES (22, 'Pollux b', false, 1590, 15);
INSERT INTO public.planet VALUES (23, 'Deneb b', false, 13, 16);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Rocky planet', 'Solid, rocky surface and composition. Examples are Mercury, Venus, Earth, Mars.', 'Terrestrial planet');
INSERT INTO public.planet_types VALUES (2, 'Jupiter-like planet', 'Larger planets predominantly made of gases like hydrogen and helium. Have no solid surface.', 'Gas giant');
INSERT INTO public.planet_types VALUES (3, 'Neptune-like planet', 'Gas giants with icy compositions. Larger than Earth but smaller than Jupiter/Saturn.', 'Ice giant');
INSERT INTO public.planet_types VALUES (4, 'Super-Earth', 'Rocky interiors, potentially habitable if conditions allow liquid water.', 'Super-Earth');
INSERT INTO public.planet_types VALUES (5, 'Giant planet on close orbit', 'Jupiter-sized planet very close to its star in non-habitable zone. Often highly heated and tidally locked.', 'Hot Jupiter');
INSERT INTO public.planet_types VALUES (6, 'Waterworld', 'Hypothetical planets where water constitutes a high percentage of the mass. Could support microbial life.', 'Ocean planet');
INSERT INTO public.planet_types VALUES (7, 'Small rocky planets close to stars', 'Rocky planets in very close orbits around their stars, often tidally locked with one side always facing the star. Usually too hot for life.', 'Hot super-Earth');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (9, 'Sun', 4567, 0.000, 7);
INSERT INTO public.star VALUES (10, 'Sirius', 250, 8.600, 7);
INSERT INTO public.star VALUES (11, 'Proxima Centauri', 4500, 4.200, 7);
INSERT INTO public.star VALUES (12, 'Rigil Kentaurus', 1000, 4.300, 7);
INSERT INTO public.star VALUES (13, 'Aldebaran', 1320, 65.000, 7);
INSERT INTO public.star VALUES (14, 'Alpha Centauri B', 4500, 4.400, 7);
INSERT INTO public.star VALUES (15, 'Pollux', 1590, 34.000, 7);
INSERT INTO public.star VALUES (16, 'Deneb', 13, 1500.000, 7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 23, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 7, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 16, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_galaxy_type_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_galaxy_type_id_key UNIQUE (galaxy_types_id);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: galaxy galaxy_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique UNIQUE (galaxy_id);


--
-- Name: moon moon_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_unique UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_unique UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: planet_types planet_types_planet_type_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_planet_type_id_key UNIQUE (planet_types_id);


--
-- Name: star star_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_unique UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_types_id_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


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

