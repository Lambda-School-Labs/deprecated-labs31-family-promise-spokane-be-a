--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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
-- Name: families; Type: TABLE; Schema: public; Owner: lrod
--

CREATE TABLE public.families (
    id integer NOT NULL,
    user_id integer NOT NULL,
    case_number integer NOT NULL,
    phone_one jsonb,
    phone_two jsonb,
    "emergencyContact" jsonb,
    vehicle jsonb,
    last_permanent_address character varying(255),
    homeless_info jsonb,
    gov_benefits jsonb,
    insurance jsonb,
    domestic_violence_info jsonb,
    avatar_url character varying(255)
);


ALTER TABLE public.families OWNER TO lrod;

--
-- Name: families_id_seq; Type: SEQUENCE; Schema: public; Owner: lrod
--

CREATE SEQUENCE public.families_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.families_id_seq OWNER TO lrod;

--
-- Name: families_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lrod
--

ALTER SEQUENCE public.families_id_seq OWNED BY public.families.id;


--
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: lrod
--

CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE public.knex_migrations OWNER TO lrod;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: lrod
--

CREATE SEQUENCE public.knex_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_id_seq OWNER TO lrod;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lrod
--

ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;


--
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: lrod
--

CREATE TABLE public.knex_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);


ALTER TABLE public.knex_migrations_lock OWNER TO lrod;

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE; Schema: public; Owner: lrod
--

CREATE SEQUENCE public.knex_migrations_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_lock_index_seq OWNER TO lrod;

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lrod
--

ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNED BY public.knex_migrations_lock.index;


--
-- Name: logs; Type: TABLE; Schema: public; Owner: lrod
--

CREATE TABLE public.logs (
    id integer NOT NULL,
    user_id integer NOT NULL,
    family_id integer NOT NULL,
    checked_in boolean,
    date date,
    "time" timestamp with time zone
);


ALTER TABLE public.logs OWNER TO lrod;

--
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: lrod
--

CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_id_seq OWNER TO lrod;

--
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lrod
--

ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;


--
-- Name: members; Type: TABLE; Schema: public; Owner: lrod
--

CREATE TABLE public.members (
    id integer NOT NULL,
    family_id integer NOT NULL,
    demographics json,
    bearers json,
    schools json,
    flag character varying(255),
    pet integer
);


ALTER TABLE public.members OWNER TO lrod;

--
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: lrod
--

CREATE SEQUENCE public.members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.members_id_seq OWNER TO lrod;

--
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lrod
--

ALTER SEQUENCE public.members_id_seq OWNED BY public.members.id;


--
-- Name: notes; Type: TABLE; Schema: public; Owner: lrod
--

CREATE TABLE public.notes (
    id integer NOT NULL,
    family_id integer NOT NULL,
    author_id integer NOT NULL,
    subject character varying(255) NOT NULL,
    content character varying(255) NOT NULL,
    date date,
    "time" timestamp with time zone
);


ALTER TABLE public.notes OWNER TO lrod;

--
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: lrod
--

CREATE SEQUENCE public.notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notes_id_seq OWNER TO lrod;

--
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lrod
--

ALTER SEQUENCE public.notes_id_seq OWNED BY public.notes.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: lrod
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(128),
    name character varying(255),
    email character varying(255),
    okta_id character varying(256),
    role character varying(255) DEFAULT 'pending'::character varying
);


ALTER TABLE public.users OWNER TO lrod;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: lrod
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO lrod;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lrod
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: families id; Type: DEFAULT; Schema: public; Owner: lrod
--

ALTER TABLE ONLY public.families ALTER COLUMN id SET DEFAULT nextval('public.families_id_seq'::regclass);


--
-- Name: knex_migrations id; Type: DEFAULT; Schema: public; Owner: lrod
--

ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);


--
-- Name: knex_migrations_lock index; Type: DEFAULT; Schema: public; Owner: lrod
--

ALTER TABLE ONLY public.knex_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_migrations_lock_index_seq'::regclass);


--
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: lrod
--

ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);


--
-- Name: members id; Type: DEFAULT; Schema: public; Owner: lrod
--

ALTER TABLE ONLY public.members ALTER COLUMN id SET DEFAULT nextval('public.members_id_seq'::regclass);


--
-- Name: notes id; Type: DEFAULT; Schema: public; Owner: lrod
--

ALTER TABLE ONLY public.notes ALTER COLUMN id SET DEFAULT nextval('public.notes_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: lrod
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: families; Type: TABLE DATA; Schema: public; Owner: lrod
--

COPY public.families (id, user_id, case_number, phone_one, phone_two, "emergencyContact", vehicle, last_permanent_address, homeless_info, gov_benefits, insurance, domestic_violence_info, avatar_url) FROM stdin;
1	2	22	{"name": "Mark", "number": "202-555-0177", "safeToLeaveMssg": true}	{"name": "Jacob Smith", "number": "770-555-0114", "safeToLeaveMssg": false}	{"name": "Steve Martin", "number": "410-555-0173"}	{"make": "BMW", "year": 2007, "color": "red", "model": "K1200LT", "license_plate": "699-VHT"}	7271 Hickory Rd Sterling VA 20164 	{"prior_location": "relatives", "current_location": "car", "num_times_homeless": 2, "total_len_homeless": 1, "homeless_start_date": "26-AUG-2019", "length_at_prior_location": "2 weeks", "length_at_current_location": "3 days"}	{"RRH": false, "snap": true, "cps_fps": false, "foodstamps": true, "housing_voucher": false, "veteran_services": true}	{"pregnancies": false, "has_insurance": true, "members_covered": 2, "health_insurance_type": "Medicare"}	{"fleeing_dv": false, "YWCA_contacted": false, "has_court_order": false, "date_last_incident": false, "anonymity_preferred": true}	https://microlancer.lancerassets.com/v2/services/91/166a65bdfc45e5ade4cee71859b871/large_avatar.jpg
2	1	25	{"name": "John", "number": "202-555-0177", "safeToLeaveMssg": true}	{"name": "lee Smith", "number": "770-555-0114", "safeToLeaveMssg": false}	{"name": "Steve Guy", "number": "410-555-0173"}	{"make": "BMW", "year": 2007, "color": "red", "model": "K1200LT", "license_plate": "699-VHT"}	7271 Hickory Rd Sterling VA 20164 	{"prior_location": "relatives", "current_location": "car", "num_times_homeless": 2, "total_len_homeless": 1, "homeless_start_date": "26-AUG-2019", "length_at_prior_location": "2 weeks", "length_at_current_location": "3 days"}	{"RRH": false, "snap": true, "cps/fps": false, "foodstamps": true, "housing_voucher": false, "veteran_services": true}	{"pregnancies": false, "has_insurance": true, "members_covered": 2, "health_insurance_type": "Medicare"}	{"fleeing_dv": false, "YWCA_contacted": false, "has_court_order": false, "date_last_incident": false, "anonymity_preferred": true}	https://microlancer.lancerassets.com/v2/services/91/166a65bdfc45e5ade4cee71859b871/large_avatar.jpg
3	1	25	{"name": "John", "number": "202-555-0177", "safeToLeaveMssg": true}	{"name": "lee Smith", "number": "770-555-0114", "safeToLeaveMssg": false}	{"name": "Steve Guy", "number": "410-555-0173"}	{"make": "BMW", "year": 2007, "color": "red", "model": "K1200LT", "license_plate": "699-VHT"}	7271 Hickory Rd Sterling VA 20164 	{"prior_location": "relatives", "current_location": "car", "num_times_homeless": 2, "total_len_homeless": 1, "homeless_start_date": "26-AUG-2019", "length_at_prior_location": "2 weeks", "length_at_current_location": "3 days"}	{"RRH": false, "snap": true, "cps/fps": false, "foodstamps": true, "housing_voucher": false, "veteran_services": true}	{"pregnancies": false, "has_insurance": true, "members_covered": 2, "health_insurance_type": "Medicare"}	{"fleeing_dv": false, "YWCA_contacted": false, "has_court_order": false, "date_last_incident": false, "anonymity_preferred": true}	https://microlancer.lancerassets.com/v2/services/91/166a65bdfc45e5ade4cee71859b871/large_avatar.jpg
4	1	25	{"name": "John", "number": "202-555-0177", "safeToLeaveMssg": true}	{"name": "lee Smith", "number": "770-555-0114", "safeToLeaveMssg": false}	{"name": "Steve Guy", "number": "410-555-0173"}	{"make": "BMW", "year": 2007, "color": "red", "model": "K1200LT", "license_plate": "699-VHT"}	7271 Hickory Rd Sterling VA 20164 	{"prior_location": "relatives", "current_location": "car", "num_times_homeless": 2, "total_len_homeless": 1, "homeless_start_date": "26-AUG-2019", "length_at_prior_location": "2 weeks", "length_at_current_location": "3 days"}	{"RRH": false, "snap": true, "cps/fps": false, "foodstamps": true, "housing_voucher": false, "veteran_services": true}	{"pregnancies": false, "has_insurance": true, "members_covered": 2, "health_insurance_type": "Medicare"}	{"fleeing_dv": false, "YWCA_contacted": false, "has_court_order": false, "date_last_incident": false, "anonymity_preferred": true}	https://microlancer.lancerassets.com/v2/services/91/166a65bdfc45e5ade4cee71859b871/large_avatar.jpg
5	1	25	{"name": "John", "number": "202-555-0177", "safeToLeaveMssg": true}	{"name": "lee Smith", "number": "770-555-0114", "safeToLeaveMssg": false}	{"name": "Steve Guy", "number": "410-555-0173"}	{"make": "BMW", "year": 2007, "color": "red", "model": "K1200LT", "license_plate": "699-VHT"}	7271 Hickory Rd Sterling VA 20164 	{"prior_location": "relatives", "current_location": "car", "num_times_homeless": 2, "total_len_homeless": 1, "homeless_start_date": "26-AUG-2019", "length_at_prior_location": "2 weeks", "length_at_current_location": "3 days"}	{"RRH": false, "snap": true, "cps/fps": false, "foodstamps": true, "housing_voucher": false, "veteran_services": true}	{"pregnancies": false, "has_insurance": true, "members_covered": 2, "health_insurance_type": "Medicare"}	{"fleeing_dv": false, "YWCA_contacted": false, "has_court_order": false, "date_last_incident": false, "anonymity_preferred": true}	https://microlancer.lancerassets.com/v2/services/91/166a65bdfc45e5ade4cee71859b871/large_avatar.jpg
\.


--
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: lrod
--

COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
1	20201209123909_users.js	1	2020-12-15 11:08:36.055-06
2	20201209130335_families.js	1	2020-12-15 11:08:36.064-06
3	20201209155624_logs.js	1	2020-12-15 11:08:36.068-06
4	20201209160611_members.js	1	2020-12-15 11:08:36.073-06
5	20201209161927_notes.js	1	2020-12-15 11:08:36.079-06
\.


--
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: lrod
--

COPY public.knex_migrations_lock (index, is_locked) FROM stdin;
1	0
\.


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: lrod
--

COPY public.logs (id, user_id, family_id, checked_in, date, "time") FROM stdin;
1	1	1	t	2020-10-09	2020-12-09 11:38:31.123-06
2	1	1	t	2020-12-10	2020-12-10 12:01:40.038-06
3	1	1	t	2020-12-11	2020-12-11 11:38:31.123-06
4	1	1	t	2020-12-12	2020-12-12 11:38:31.123-06
\.


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: lrod
--

COPY public.members (id, family_id, demographics, bearers, schools, flag, pet) FROM stdin;
1	1	{"first_name":"Joe","last_name":"Clemmons","gender":"male","relationship":"cousin","DOB":"10-23-1992","SSN":9999,"income":20000,"employer":"union","race":"White"}	{"alcohol_abuse":false,"developmental_disabilities":false,"chronic_health_issues":false,"drug_abuse":false,"HIV-AIDs":false,"mental_illness":false,"physical_disabilities":false,"list_indefinite_conditions":null,"list_issues":null}	{"highest_grade_completed":"12th grade","enrolled_status":false,"reason_not_enrolled":"finished","attendance_status":"inactive","school_type":null,"school_name":null,"mckinney_school":false}	none	0
2	1	{"first_name":"Susy","last_name":"Clemmons","gender":"female","relationship":"daughter","DOB":"01-03-2012","SSN":9999,"income":20000,"employer":"na","race":"White"}	{"alcohol_abuse":false,"developmental_disabilities":false,"chronic_health_issues":false,"drug_abuse":false,"HIV-AIDs":false,"mental_illness":false,"physical_disabilities":false,"list_indefinite_conditions":null,"list_issues":null}	{"highest_grade_completed":"2nd grade","enrolled_status":true,"reason_not_enrolled":"na","attendance_status":"active","school_type":"elementary","school_name":"wright elementary","mckinney_school":false}	none	0
\.


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: lrod
--

COPY public.notes (id, family_id, author_id, subject, content, date, "time") FROM stdin;
2	1	1	Family needs	Family needs assitance with hospital bills	2020-12-14	2020-12-13 21:15:31.031-06
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: lrod
--

COPY public.users (id, username, name, email, okta_id, role) FROM stdin;
1	john	john	john@email.com	0001	supervisor
2	mark	mark	mark@email.com	0002	guest
\.


--
-- Name: families_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lrod
--

SELECT pg_catalog.setval('public.families_id_seq', 5, true);


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lrod
--

SELECT pg_catalog.setval('public.knex_migrations_id_seq', 5, true);


--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE SET; Schema: public; Owner: lrod
--

SELECT pg_catalog.setval('public.knex_migrations_lock_index_seq', 1, true);


--
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lrod
--

SELECT pg_catalog.setval('public.logs_id_seq', 4, true);


--
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lrod
--

SELECT pg_catalog.setval('public.members_id_seq', 2, true);


--
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lrod
--

SELECT pg_catalog.setval('public.notes_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lrod
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: families families_pkey; Type: CONSTRAINT; Schema: public; Owner: lrod
--

ALTER TABLE ONLY public.families
    ADD CONSTRAINT families_pkey PRIMARY KEY (id);


--
-- Name: knex_migrations_lock knex_migrations_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: lrod
--

ALTER TABLE ONLY public.knex_migrations_lock
    ADD CONSTRAINT knex_migrations_lock_pkey PRIMARY KEY (index);


--
-- Name: knex_migrations knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: lrod
--

ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: lrod
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: lrod
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: lrod
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: lrod
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: families families_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lrod
--

ALTER TABLE ONLY public.families
    ADD CONSTRAINT families_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: logs logs_family_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lrod
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_family_id_foreign FOREIGN KEY (family_id) REFERENCES public.families(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: logs logs_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lrod
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: members members_family_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lrod
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_family_id_foreign FOREIGN KEY (family_id) REFERENCES public.families(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: notes notes_author_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lrod
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_author_id_foreign FOREIGN KEY (author_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: notes notes_family_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lrod
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_family_id_foreign FOREIGN KEY (family_id) REFERENCES public.families(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

