--
-- PostgreSQL database dump
--

\restrict JbQDLxahIJ2mtTdMEXiOgISsq8xbEDFYub9CdkBRdiaAMg4pLtUzo7pSwUKVqGn

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: enum_multimedia_files_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_multimedia_files_type AS ENUM (
    'image',
    'video'
);


ALTER TYPE public.enum_multimedia_files_type OWNER TO postgres;

--
-- Name: enum_multimedia_info_classification; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_multimedia_info_classification AS ENUM (
    'fortificaciones',
    'obstaculos'
);


ALTER TYPE public.enum_multimedia_info_classification OWNER TO postgres;

--
-- Name: enum_users_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_users_role AS ENUM (
    'user',
    'admin'
);


ALTER TYPE public.enum_users_role OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: multimedia_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.multimedia_files (
    id integer NOT NULL,
    url character varying(255) NOT NULL,
    type public.enum_multimedia_files_type NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.multimedia_files OWNER TO postgres;

--
-- Name: multimedia_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.multimedia_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.multimedia_files_id_seq OWNER TO postgres;

--
-- Name: multimedia_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.multimedia_files_id_seq OWNED BY public.multimedia_files.id;


--
-- Name: multimedia_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.multimedia_info (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    classification public.enum_multimedia_info_classification NOT NULL,
    type character varying(50) NOT NULL,
    multimedia_id integer NOT NULL,
    parent_id integer,
    step_order integer,
    is_active boolean DEFAULT true,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.multimedia_info OWNER TO postgres;

--
-- Name: multimedia_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.multimedia_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.multimedia_info_id_seq OWNER TO postgres;

--
-- Name: multimedia_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.multimedia_info_id_seq OWNED BY public.multimedia_info.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    role public.enum_users_role DEFAULT 'user'::public.enum_users_role NOT NULL,
    is_super_admin boolean DEFAULT false NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: multimedia_files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.multimedia_files ALTER COLUMN id SET DEFAULT nextval('public.multimedia_files_id_seq'::regclass);


--
-- Name: multimedia_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.multimedia_info ALTER COLUMN id SET DEFAULT nextval('public.multimedia_info_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: multimedia_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.multimedia_files (id, url, type, "createdAt", "updatedAt") FROM stdin;
1	uploads/images/1783904124307-640821964.png	image	2026-07-13 00:55:24.333+00	2026-07-13 00:55:24.333+00
2	uploads/images/1783904124320-467534388.png	image	2026-07-13 00:55:24.343+00	2026-07-13 00:55:24.343+00
3	uploads/images/1784901214842-540136823.png	image	2026-07-24 13:53:34.971+00	2026-07-24 13:53:34.971+00
4	uploads/images/1784901214859-732503103.png	image	2026-07-24 13:53:34.993+00	2026-07-24 13:53:34.993+00
5	uploads/images/1784901214890-185799136.png	image	2026-07-24 13:53:35+00	2026-07-24 13:53:35+00
6	uploads/images/1784901214907-659673004.png	image	2026-07-24 13:53:35.006+00	2026-07-24 13:53:35.006+00
7	uploads/images/1784901214921-521561505.png	image	2026-07-24 13:53:35.01+00	2026-07-24 13:53:35.01+00
8	uploads/images/1784901214940-916309569.png	image	2026-07-24 13:53:35.017+00	2026-07-24 13:53:35.017+00
9	uploads/images/1784901655541-377014287.png	image	2026-07-24 14:00:55.597+00	2026-07-24 14:00:55.597+00
10	uploads/images/1784901655562-146203242.png	image	2026-07-24 14:00:55.607+00	2026-07-24 14:00:55.607+00
11	uploads/images/1784901655578-846946790.png	image	2026-07-24 14:00:55.612+00	2026-07-24 14:00:55.612+00
\.


--
-- Data for Name: multimedia_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.multimedia_info (id, name, description, classification, type, multimedia_id, parent_id, step_order, is_active, "createdAt", "updatedAt") FROM stdin;
2	adsd	adawsD	fortificaciones	dsfSDAFC	2	1	1	t	2026-07-13 00:55:24.344+00	2026-07-13 00:55:24.344+00
1	wefrsdaf	dfsdFSDXCD	fortificaciones	dsfSDAFC	1	\N	\N	f	2026-07-13 00:55:24.339+00	2026-07-13 00:55:54.218+00
3	Erizo	Un erizo es una fortificacion defensiva estatica de 1.4 metros de altura formado por 3 vigas cruzadas en angulos rectos. En suelo arenoso, su eficacia principal radica en apoyarse en bases ensanchadas de plataformas de soporte para evitar que la estructura se hunda al recibir el peso.	fortificaciones	Arenoso	3	\N	\N	t	2026-07-24 13:53:34.987+00	2026-07-24 13:53:34.987+00
4	Paso 1: Unir vigas	Unir vigas para formar el erizo	fortificaciones	Arenoso	4	3	1	t	2026-07-24 13:53:34.995+00	2026-07-24 13:54:25.823+00
5	Paso 2: Combinarlo con alambre de púas	Rodear el erizo compretamente con alambre de púas	fortificaciones	Arenoso	5	3	2	t	2026-07-24 13:53:35.003+00	2026-07-24 13:54:25.831+00
6	Paso 3: Vertir base de concreto	Una vez definida la zona en la que se colocaran los erizos	fortificaciones	Arenoso	6	3	3	t	2026-07-24 13:53:35.008+00	2026-07-24 13:54:25.833+00
7	Paso 4: Colocar erizo	Colocar el erizo sobre la base de concreto	fortificaciones	Arenoso	7	3	4	t	2026-07-24 13:53:35.013+00	2026-07-24 13:54:25.834+00
8	Paso 5: Repetir el paso	Repetir el paso hasta bloquear el paso vehicular	fortificaciones	Arenoso	8	3	5	t	2026-07-24 13:53:35.018+00	2026-07-24 13:54:25.837+00
9	Ramadas	La obstaculización vehicular por ramadas corresponde a la ocupación ilegal o informal de la vía pública con estructuras temporales, como techos de ramas, carpas o tinglados comerciales típicos de festividades o ferias, que reducen los carriles de circulación, bloquean la visibilidad y ponen en riesgo el tráfico.	obstaculos	Ramadas	9	\N	\N	t	2026-07-24 14:00:55.601+00	2026-07-24 14:00:55.601+00
10	Selección de ramas	Seleccionar las ramas que se colocaran en la obstaculizacion	obstaculos	Ramadas	10	9	1	t	2026-07-24 14:00:55.609+00	2026-07-24 14:00:55.609+00
11	Colocar ramada	Despues de haber seleccionado las ramas y de haber establecido el lugar donde se colocaran, se colocan las ramadas.	obstaculos	Ramadas	11	9	2	t	2026-07-24 14:00:55.613+00	2026-07-24 14:00:55.613+00
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, role, is_super_admin, "createdAt", "updatedAt") FROM stdin;
1	gonza	$2b$12$34.2Quz3rG6CxzmbYijjKubhpuhJEJwHW9lDkj/Nr1oTnzzkciofi	admin	t	2026-07-13 00:53:02.482+00	2026-07-13 00:53:02.482+00
\.


--
-- Name: multimedia_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.multimedia_files_id_seq', 11, true);


--
-- Name: multimedia_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.multimedia_info_id_seq', 11, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: multimedia_files multimedia_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.multimedia_files
    ADD CONSTRAINT multimedia_files_pkey PRIMARY KEY (id);


--
-- Name: multimedia_info multimedia_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.multimedia_info
    ADD CONSTRAINT multimedia_info_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: users users_username_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key1 UNIQUE (username);


--
-- Name: users users_username_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key2 UNIQUE (username);


--
-- Name: users users_username_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key3 UNIQUE (username);


--
-- Name: idx_multimedia_info_classification; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_multimedia_info_classification ON public.multimedia_info USING btree (classification);


--
-- Name: idx_multimedia_info_parent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_multimedia_info_parent ON public.multimedia_info USING btree (parent_id);


--
-- Name: idx_multimedia_info_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_multimedia_info_type ON public.multimedia_info USING btree (type);


--
-- Name: unique_catalog_main_title; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_catalog_main_title ON public.multimedia_info USING btree (name) WHERE ((parent_id IS NULL) AND (is_active = true));


--
-- Name: multimedia_info multimedia_info_multimedia_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.multimedia_info
    ADD CONSTRAINT multimedia_info_multimedia_id_fkey FOREIGN KEY (multimedia_id) REFERENCES public.multimedia_files(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: multimedia_info multimedia_info_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.multimedia_info
    ADD CONSTRAINT multimedia_info_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.multimedia_info(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict JbQDLxahIJ2mtTdMEXiOgISsq8xbEDFYub9CdkBRdiaAMg4pLtUzo7pSwUKVqGn

