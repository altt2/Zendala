--
-- PostgreSQL database dump
--

\restrict cNBGBqURWHTY2zjaMx2rTAqJ13f1hvEm01HhXciukgc5bqOoGg0la2Ax8mguDu3

-- Dumped from database version 16.10 (0374078)
-- Dumped by pg_dump version 16.10

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
-- Name: access_logs; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.access_logs (
    id character varying DEFAULT gen_random_uuid() NOT NULL,
    qr_code_id character varying NOT NULL,
    guard_id character varying NOT NULL,
    accessed_at timestamp without time zone DEFAULT now(),
    access_type character varying(50),
    vehicle_plates character varying,
    notes text
);


ALTER TABLE public.access_logs OWNER TO neondb_owner;

--
-- Name: qr_codes; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.qr_codes (
    id character varying DEFAULT gen_random_uuid() NOT NULL,
    code character varying NOT NULL,
    visitor_name character varying NOT NULL,
    visitor_type character varying(50) NOT NULL,
    description text,
    created_by_id character varying NOT NULL,
    is_used character varying DEFAULT 'false'::character varying NOT NULL,
    used_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT now(),
    access_password character varying DEFAULT ''::character varying NOT NULL,
    expires_at timestamp without time zone
);


ALTER TABLE public.qr_codes OWNER TO neondb_owner;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.sessions (
    sid character varying NOT NULL,
    sess jsonb NOT NULL,
    expire timestamp without time zone NOT NULL
);


ALTER TABLE public.sessions OWNER TO neondb_owner;

--
-- Name: users; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.users (
    id character varying DEFAULT gen_random_uuid() NOT NULL,
    email character varying,
    first_name character varying,
    last_name character varying,
    profile_image_url character varying,
    role character varying(20) DEFAULT 'vecino'::character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    username character varying,
    password_hash character varying
);


ALTER TABLE public.users OWNER TO neondb_owner;

--
-- Data for Name: access_logs; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.access_logs (id, qr_code_id, guard_id, accessed_at, access_type, vehicle_plates, notes) FROM stdin;
ee80cc8a-1526-4a46-8c88-f2a344c8f1aa	61ef8891-6e3c-492f-a3ad-9e35709d5b08	3b5741bc-4bdb-4d17-b264-bdfb8758eb2a	2025-11-26 01:11:03.469153	pie	\N	\N
e905d8be-6d63-4262-ab6c-5d7c8a421907	5545ebf7-cf5a-4b72-b5d2-6190cd37bcb5	3b5741bc-4bdb-4d17-b264-bdfb8758eb2a	2025-11-26 01:13:43.286693	vehiculo	Adr-543h	\N
dd7a1eff-cdb4-46f2-8479-67123c95cfdc	db08e69c-2442-41f7-8c37-75c70cd61bc0	3b5741bc-4bdb-4d17-b264-bdfb8758eb2a	2025-11-26 15:38:46.524908	vehiculo	Fjgfgj	\N
6dfc3e84-682a-4090-8311-08084b3955cf	71cd8335-0b8f-4997-8025-afce34faa7d3	3b5741bc-4bdb-4d17-b264-bdfb8758eb2a	2025-11-27 04:28:25.125313	pie	\N	\N
299252c0-2358-4c03-a3a9-0e2d875acf11	4f7e4ac8-4142-4476-b7f2-76f3d5d2b31f	3b5741bc-4bdb-4d17-b264-bdfb8758eb2a	2025-11-27 04:30:04.33683	pie	\N	Rechazo
\.


--
-- Data for Name: qr_codes; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.qr_codes (id, code, visitor_name, visitor_type, description, created_by_id, is_used, used_at, created_at, access_password, expires_at) FROM stdin;
61ef8891-6e3c-492f-a3ad-9e35709d5b08	9b7ceec4-de56-4835-95bd-5bba9951bec7	Prueba	visita		50141203	unused	2025-11-26 01:11:03.434	2025-11-26 00:35:33.778556	WPPB-2385	\N
5545ebf7-cf5a-4b72-b5d2-6190cd37bcb5	7f6397b3-c66f-4982-ad80-0d4bf3f22f02	Prueba 2	proveedor		3b5741bc-4bdb-4d17-b264-bdfb8758eb2a	unused	2025-11-26 01:13:43.255	2025-11-26 01:11:54.591254	ANOY-8008	\N
6f33e331-9069-4007-8d24-f4de627022d4	bd0aac9c-86d0-49b3-b98e-d76b93994ed8	Prueba 3	prestador		3b5741bc-4bdb-4d17-b264-bdfb8758eb2a	unused	\N	2025-11-26 01:18:18.667995	CRUY-4519	\N
db08e69c-2442-41f7-8c37-75c70cd61bc0	98e17e81-3c4b-4f71-80e0-21028ccfc814	Aldo	proveedor		3b5741bc-4bdb-4d17-b264-bdfb8758eb2a	unused	2025-11-26 15:38:46.489	2025-11-26 15:37:03.076138	RJSU-6883	\N
532d035d-df27-44f3-9982-9a04581489da	62fe6dec-e706-47cf-a48f-6e3d90bb2b7d	Jonathan	visita		311a0a2b-b54d-4a5c-9148-6fe0d0b2c7a2	unused	\N	2025-11-26 15:45:37.982293	KXMY-5338	\N
71cd8335-0b8f-4997-8025-afce34faa7d3	b4fb6273-a491-4f2d-a414-f700f2c24319	Aldo 2	visita		3b5741bc-4bdb-4d17-b264-bdfb8758eb2a	used	2025-11-27 04:28:25.086	2025-11-27 04:21:11.78522	VYNZ-8804	2025-11-27 16:21:11.772
4f7e4ac8-4142-4476-b7f2-76f3d5d2b31f	c871858b-280d-4c34-a129-10de05cc56f8	Prueba rechazo	visita		3b5741bc-4bdb-4d17-b264-bdfb8758eb2a	used	2025-11-27 04:30:04.299	2025-11-27 04:29:21.378455	ZLFL-2824	\N
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.sessions (sid, sess, expire) FROM stdin;
vQMUN43PDbRExVqMbGcL9A5nQMdtnnho	{"cookie": {"path": "/", "secure": true, "expires": "2025-12-03T15:47:28.515Z", "httpOnly": true, "originalMaxAge": 604800000}}	2025-12-03 15:47:29
M2YTwM0Z0f92O49kRd2XYxkf3cQuE78Z	{"cookie": {"path": "/", "secure": true, "expires": "2025-12-02T20:48:13.138Z", "httpOnly": true, "originalMaxAge": 604800000}, "passport": {"user": {"claims": {"aud": "36f5d3b8-3b9c-43c3-912a-aa6a60f8f0d7", "exp": 1764107292, "iat": 1764103692, "iss": "https://replit.com/oidc", "sub": "50141203", "email": "aldodelgadillo13@gmail.com", "at_hash": "6wE2oroyOUaPqliONuw7xQ", "username": "aldodelgadillo1", "auth_time": 1764103692, "last_name": null, "first_name": null}, "expires_at": 1764107292, "access_token": "W_1W8jonTZneYedhm_qiwIhirLOTYNIWRiuKGTqPTJX", "refresh_token": "lKwkdqswTfywBFW4Y4wTWP7yBxwHCdBKiG_LCmPI-FK"}}}	2025-12-02 20:48:20
hud2cpcPtmldPXML23qnVXBif_gZaJk1	{"cookie": {"path": "/", "secure": true, "expires": "2025-12-03T15:47:28.609Z", "httpOnly": true, "originalMaxAge": 604800000}}	2025-12-03 15:47:29
pmJPef1mKuxBeqwHfVz2945wcj_Q38oV	{"cookie": {"path": "/", "secure": true, "expires": "2025-12-04T04:05:01.774Z", "httpOnly": true, "originalMaxAge": 604800000}, "passport": {"user": {"id": "3b5741bc-4bdb-4d17-b264-bdfb8758eb2a", "role": "administrador", "username": "Alzar"}}}	2025-12-04 04:30:12
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.users (id, email, first_name, last_name, profile_image_url, role, created_at, updated_at, username, password_hash) FROM stdin;
3b5741bc-4bdb-4d17-b264-bdfb8758eb2a	\N	Alzar	Admin	\N	administrador	2025-11-24 04:13:35.762697	2025-11-24 04:13:35.762697	Alzar	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92
29f1aa55-d976-46b2-a583-8c6e4b2728cf	\N	Juan	Perez	\N	guardia	2025-11-24 04:15:49.87384	2025-11-24 04:15:49.87384	G1	a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3
623d2126-caa1-476d-ac5f-ae25f53ec5b5	\N	Administración	Admin	\N	administrador	2025-11-25 20:47:00.000455	2025-11-25 20:47:00.000455	Admin	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92
50141203	aldodelgadillo13@gmail.com	\N	\N	\N	vecino	2025-11-24 02:07:34.226827	2025-11-26 00:31:46.955	\N	\N
311a0a2b-b54d-4a5c-9148-6fe0d0b2c7a2	\N	Aldo	Delgadillo Crivelli	\N	vecino	2025-11-24 04:00:17.776293	2025-11-26 01:29:05.2	43	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92
\.


--
-- Name: access_logs access_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.access_logs
    ADD CONSTRAINT access_logs_pkey PRIMARY KEY (id);


--
-- Name: qr_codes qr_codes_access_password_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.qr_codes
    ADD CONSTRAINT qr_codes_access_password_key UNIQUE (access_password);


--
-- Name: qr_codes qr_codes_code_unique; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.qr_codes
    ADD CONSTRAINT qr_codes_code_unique UNIQUE (code);


--
-- Name: qr_codes qr_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.qr_codes
    ADD CONSTRAINT qr_codes_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (sid);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: IDX_session_expire; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX "IDX_session_expire" ON public.sessions USING btree (expire);


--
-- Name: access_logs access_logs_guard_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.access_logs
    ADD CONSTRAINT access_logs_guard_id_users_id_fk FOREIGN KEY (guard_id) REFERENCES public.users(id);


--
-- Name: access_logs access_logs_qr_code_id_qr_codes_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.access_logs
    ADD CONSTRAINT access_logs_qr_code_id_qr_codes_id_fk FOREIGN KEY (qr_code_id) REFERENCES public.qr_codes(id);


--
-- Name: qr_codes qr_codes_created_by_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.qr_codes
    ADD CONSTRAINT qr_codes_created_by_id_users_id_fk FOREIGN KEY (created_by_id) REFERENCES public.users(id);


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;


--
-- PostgreSQL database dump complete
--

\unrestrict cNBGBqURWHTY2zjaMx2rTAqJ13f1hvEm01HhXciukgc5bqOoGg0la2Ax8mguDu3

