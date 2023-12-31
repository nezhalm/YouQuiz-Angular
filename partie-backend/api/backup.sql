--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

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
-- Name: assign_quizz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assign_quizz (
    id integer NOT NULL,
    ended_at timestamp(6) without time zone,
    result character varying(255),
    score integer,
    started_at timestamp(6) without time zone,
    quiz_id integer,
    student_id integer
);


ALTER TABLE public.assign_quizz OWNER TO postgres;

--
-- Name: assign_quizz_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assign_quizz_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assign_quizz_seq OWNER TO postgres;

--
-- Name: level; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.level (
    id integer NOT NULL,
    description character varying(255),
    max_points integer,
    min_points integer
);


ALTER TABLE public.level OWNER TO postgres;

--
-- Name: level_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.level_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.level_seq OWNER TO postgres;

--
-- Name: media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.media (
    id integer NOT NULL,
    type character varying(255),
    url character varying(255),
    question_id integer,
    CONSTRAINT media_type_check CHECK (((type)::text = ANY ((ARRAY['IMAGE'::character varying, 'VIDEO'::character varying, 'SOUND'::character varying])::text[])))
);


ALTER TABLE public.media OWNER TO postgres;

--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_id_seq OWNER TO postgres;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: media_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.media_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_seq OWNER TO postgres;

--
-- Name: question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question (
    id integer NOT NULL,
    content character varying(255),
    number_of_correct_responses integer,
    number_of_responses integer,
    points integer,
    type character varying(255),
    level_id integer,
    subject_id integer,
    CONSTRAINT question_type_check CHECK (((type)::text = ANY ((ARRAY['SINGLE'::character varying, 'MULTI'::character varying, 'DIRECT'::character varying])::text[])))
);


ALTER TABLE public.question OWNER TO postgres;

--
-- Name: question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_id_seq OWNER TO postgres;

--
-- Name: question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.question_id_seq OWNED BY public.question.id;


--
-- Name: question_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_seq OWNER TO postgres;

--
-- Name: quiz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz (
    id integer NOT NULL,
    duration time(6) without time zone,
    number_of_chances integer,
    remarks character varying(255),
    score integer,
    show_responses boolean,
    show_result boolean,
    trainer_id integer
);


ALTER TABLE public.quiz OWNER TO postgres;

--
-- Name: quiz_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quiz_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quiz_seq OWNER TO postgres;

--
-- Name: quizz_question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quizz_question (
    id integer NOT NULL,
    duration numeric(21,0),
    question_id integer,
    quiz_id integer
);


ALTER TABLE public.quizz_question OWNER TO postgres;

--
-- Name: quizz_question_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quizz_question_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quizz_question_seq OWNER TO postgres;

--
-- Name: response; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.response (
    id integer NOT NULL,
    content character varying(255)
);


ALTER TABLE public.response OWNER TO postgres;

--
-- Name: response_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.response_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.response_id_seq OWNER TO postgres;

--
-- Name: response_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.response_id_seq OWNED BY public.response.id;


--
-- Name: response_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.response_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.response_seq OWNER TO postgres;

--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id integer NOT NULL,
    address character varying(255),
    birthdate numeric(21,0),
    firstname character varying(255),
    lastname character varying(255),
    registered_at date
);


ALTER TABLE public.student OWNER TO postgres;

--
-- Name: student_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_seq OWNER TO postgres;

--
-- Name: subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subject (
    id integer NOT NULL,
    title character varying(255),
    parent_id integer
);


ALTER TABLE public.subject OWNER TO postgres;

--
-- Name: subject_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subject_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_id_seq OWNER TO postgres;

--
-- Name: subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subject_id_seq OWNED BY public.subject.id;


--
-- Name: trainer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trainer (
    id integer NOT NULL,
    address character varying(255),
    birthdate numeric(21,0),
    firstname character varying(255),
    lastname character varying(255),
    speciality character varying(255)
);


ALTER TABLE public.trainer OWNER TO postgres;

--
-- Name: trainer_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trainer_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trainer_seq OWNER TO postgres;

--
-- Name: validation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.validation (
    id integer NOT NULL,
    points integer,
    question_id integer,
    response_id integer
);


ALTER TABLE public.validation OWNER TO postgres;

--
-- Name: validation_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.validation_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.validation_seq OWNER TO postgres;

--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: question id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question ALTER COLUMN id SET DEFAULT nextval('public.question_id_seq'::regclass);


--
-- Name: response id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.response ALTER COLUMN id SET DEFAULT nextval('public.response_id_seq'::regclass);


--
-- Name: subject id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject ALTER COLUMN id SET DEFAULT nextval('public.subject_id_seq'::regclass);


--
-- Data for Name: assign_quizz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assign_quizz (id, ended_at, result, score, started_at, quiz_id, student_id) FROM stdin;
1	\N	OK	\N	\N	2	1
3	2023-11-20 09:30:00	R├®ussi	80	2023-11-20 08:00:00	2	1
4	2023-11-20 09:30:00	R├®ussi	80	2023-11-20 08:00:00	2	1
5	2023-11-20 09:30:00	R├®ussi	80	2023-11-20 08:00:00	2	1
\.


--
-- Data for Name: level; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.level (id, description, max_points, min_points) FROM stdin;
1	test	3	1
2	testninterm├®diaire	10	5
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.media (id, type, url, question_id) FROM stdin;
1	\N	test	1
2	\N	test	2
3	VIDEO	test	2
52	VIDEO	test	2
53	VIDEO	test	2
54	VIDEO	test	2
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question (id, content, number_of_correct_responses, number_of_responses, points, type, level_id, subject_id) FROM stdin;
1	Nouveau contenu de la question	4	6	15	SINGLE	2	6
3	Nouveau contenu de la question	4	6	15	SINGLE	2	6
2	 contenu de la question	4	6	15	SINGLE	2	6
\.


--
-- Data for Name: quiz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quiz (id, duration, number_of_chances, remarks, score, show_responses, show_result, trainer_id) FROM stdin;
2	\N	3	Remarques sur le quiz	2	t	t	1
\.


--
-- Data for Name: quizz_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quizz_question (id, duration, question_id, quiz_id) FROM stdin;
\.


--
-- Data for Name: response; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.response (id, content) FROM stdin;
1	zzz
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (id, address, birthdate, firstname, lastname, registered_at) FROM stdin;
2	\N	\N	aziz	\N	\N
3	\N	\N	hanane	\N	\N
4	\N	\N	ee	\N	\N
1	FRGDF	\N	nezha	ETYG	\N
\.


--
-- Data for Name: subject; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subject (id, title, parent_id) FROM stdin;
6	TT	\N
1	test	6
2	subject1	1
3	subject1	1
4	tes3a	\N
\.


--
-- Data for Name: trainer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trainer (id, address, birthdate, firstname, lastname, speciality) FROM stdin;
1	\N	\N	AMINA	\N	testing
2	\N	\N	\N	\N	testing
3	nez@gmail	\N	nez	nez	testing
4	nez@gmail	\N	nez	hh	testing
\.


--
-- Data for Name: validation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.validation (id, points, question_id, response_id) FROM stdin;
\.


--
-- Name: assign_quizz_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assign_quizz_seq', 51, true);


--
-- Name: level_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.level_seq', 1, false);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.media_id_seq', 1, false);


--
-- Name: media_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.media_seq', 101, true);


--
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_id_seq', 3, true);


--
-- Name: question_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_seq', 1, false);


--
-- Name: quiz_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quiz_seq', 51, true);


--
-- Name: quizz_question_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quizz_question_seq', 1, false);


--
-- Name: response_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.response_id_seq', 1, true);


--
-- Name: response_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.response_seq', 51, true);


--
-- Name: student_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_seq', 51, true);


--
-- Name: subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subject_id_seq', 4, true);


--
-- Name: trainer_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trainer_seq', 51, true);


--
-- Name: validation_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.validation_seq', 51, true);


--
-- Name: assign_quizz assign_quizz_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assign_quizz
    ADD CONSTRAINT assign_quizz_pkey PRIMARY KEY (id);


--
-- Name: level level_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level
    ADD CONSTRAINT level_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- Name: quiz quiz_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz
    ADD CONSTRAINT quiz_pkey PRIMARY KEY (id);


--
-- Name: quizz_question quizz_question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizz_question
    ADD CONSTRAINT quizz_question_pkey PRIMARY KEY (id);


--
-- Name: response response_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.response
    ADD CONSTRAINT response_pkey PRIMARY KEY (id);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- Name: subject subject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (id);


--
-- Name: trainer trainer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainer
    ADD CONSTRAINT trainer_pkey PRIMARY KEY (id);


--
-- Name: validation validation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.validation
    ADD CONSTRAINT validation_pkey PRIMARY KEY (id);


--
-- Name: media fk12mwe66aiwj4gp1lr4ny0vvt8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT fk12mwe66aiwj4gp1lr4ny0vvt8 FOREIGN KEY (question_id) REFERENCES public.question(id);


--
-- Name: validation fk20nj3aish6y3bpsou8jxkiyg9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.validation
    ADD CONSTRAINT fk20nj3aish6y3bpsou8jxkiyg9 FOREIGN KEY (question_id) REFERENCES public.question(id);


--
-- Name: assign_quizz fk7qc4p6jk2pl93hpvyi02kyf6r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assign_quizz
    ADD CONSTRAINT fk7qc4p6jk2pl93hpvyi02kyf6r FOREIGN KEY (student_id) REFERENCES public.student(id);


--
-- Name: quizz_question fk8ba58e58xwwml4omn9c7wghge; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizz_question
    ADD CONSTRAINT fk8ba58e58xwwml4omn9c7wghge FOREIGN KEY (quiz_id) REFERENCES public.quiz(id);


--
-- Name: validation fk8mqie4nxywn980w06x25miska; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.validation
    ADD CONSTRAINT fk8mqie4nxywn980w06x25miska FOREIGN KEY (response_id) REFERENCES public.response(id);


--
-- Name: assign_quizz fkjpg6x5h9v71xcoscbkuvu1c96; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assign_quizz
    ADD CONSTRAINT fkjpg6x5h9v71xcoscbkuvu1c96 FOREIGN KEY (quiz_id) REFERENCES public.quiz(id);


--
-- Name: question fkkfvh71q42645g7p9cgxjygbgc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT fkkfvh71q42645g7p9cgxjygbgc FOREIGN KEY (subject_id) REFERENCES public.subject(id);


--
-- Name: question fknsi1tkkbj9l1yw7vdts852vgf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT fknsi1tkkbj9l1yw7vdts852vgf FOREIGN KEY (level_id) REFERENCES public.level(id);


--
-- Name: quizz_question fkou3xtmj9dl34nkhrmp1r8105g; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizz_question
    ADD CONSTRAINT fkou3xtmj9dl34nkhrmp1r8105g FOREIGN KEY (question_id) REFERENCES public.question(id);


--
-- Name: quiz fkqb3d3ceqfrud11c0pxuys0s6a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz
    ADD CONSTRAINT fkqb3d3ceqfrud11c0pxuys0s6a FOREIGN KEY (trainer_id) REFERENCES public.trainer(id);


--
-- Name: subject fktyf94ir65qrcevbp1p09lj5d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT fktyf94ir65qrcevbp1p09lj5d FOREIGN KEY (parent_id) REFERENCES public.subject(id);


--
-- PostgreSQL database dump complete
--

