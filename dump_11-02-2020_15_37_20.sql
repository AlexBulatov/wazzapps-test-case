--
-- PostgreSQL database dump
--

-- Dumped from database version 10.7 (Debian 10.7-1.pgdg90+1)
-- Dumped by pg_dump version 10.7 (Debian 10.7-1.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.currency DROP CONSTRAINT currency_pkey;
ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
DROP TABLE public.currency;
DROP TABLE public.alembic_version;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency (
    currency_date date NOT NULL,
    currency character varying NOT NULL,
    to_eur numeric NOT NULL
);


ALTER TABLE public.currency OWNER TO postgres;

--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
5e050ba37519
\.


--
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currency (currency_date, currency, to_eur) FROM stdin;
2018-01-01	USD	1.201496
2018-01-01	RUB	69.66358
2018-01-02	USD	1.206713
2018-01-02	RUB	69.397457
2019-01-01	USD	1.146125
2019-01-01	RUB	78.999553
2019-01-02	USD	1.131753
2019-01-02	RUB	78.159768
2019-01-03	USD	1.139056
2019-01-03	RUB	78.474219
2019-01-04	USD	1.139556
2019-01-04	RUB	76.561093
2019-01-05	USD	1.139556
2019-01-05	RUB	76.561093
2019-01-06	USD	1.141012
2019-01-06	RUB	77.122115
2019-01-07	USD	1.147941
2019-01-07	RUB	76.663282
2019-01-08	USD	1.145574
2019-01-08	RUB	76.663513
2019-01-09	USD	1.155448
2019-01-09	RUB	77.054181
2019-01-10	USD	1.1507
2019-01-10	RUB	76.984388
2019-01-11	USD	1.146953
2019-01-11	RUB	76.725108
2019-01-12	USD	1.146953
2019-01-12	RUB	76.725108
2019-01-13	USD	1.145981
2019-01-13	RUB	76.651443
2019-01-14	USD	1.147256
2019-01-14	RUB	76.889557
2019-01-15	USD	1.141424
2019-01-15	RUB	76.530792
2019-01-16	USD	1.13977
2019-01-16	RUB	75.624884
2019-01-17	USD	1.13921
2019-01-17	RUB	75.62271
2019-01-18	USD	1.137249
2019-01-18	RUB	75.255288
2019-01-19	USD	1.137249
2019-01-19	RUB	75.255288
2019-01-20	USD	1.136519
2019-01-20	RUB	75.282898
2019-01-21	USD	1.136887
2019-01-21	RUB	75.487583
2019-01-22	USD	1.136357
2019-01-22	RUB	75.580477
2019-01-23	USD	1.138562
2019-01-23	RUB	75.227191
2019-01-24	USD	1.131095
2019-01-24	RUB	74.386945
2019-01-25	USD	1.140049
2019-01-25	RUB	75.227341
2019-01-26	USD	1.140049
2019-01-26	RUB	75.227341
2019-01-27	USD	1.141272
2019-01-27	RUB	75.074381
2019-01-28	USD	1.142851
2019-01-28	RUB	75.707912
2019-01-29	USD	1.143491
2019-01-29	RUB	75.468462
2019-01-30	USD	1.148499
2019-01-30	RUB	75.168559
2019-01-31	USD	1.144682
2019-01-31	RUB	74.86024
2018-06-01	USD	1.166583
2018-06-01	RUB	72.556814
2018-06-02	USD	1.166583
2018-06-02	RUB	72.556814
2018-06-03	USD	1.167134
2018-06-03	RUB	72.606701
2018-06-04	USD	1.170417
2018-06-04	RUB	72.610351
2018-06-05	USD	1.172882
2018-06-05	RUB	72.834804
2018-06-01	CNY	7.48702
2018-06-01	JPY	127.761868
2018-06-02	CNY	7.48702
2018-06-02	JPY	127.761868
2018-06-03	CNY	7.490546
2018-06-03	JPY	127.91905
2018-06-04	CNY	7.496412
2018-06-04	JPY	128.699094
2018-06-05	CNY	7.511252
2018-06-05	JPY	128.872764
2019-02-03	CNY	7.726042
2019-02-03	JPY	125.364974
2019-02-04	CNY	7.713236
2019-02-04	JPY	125.760892
2019-02-05	CNY	7.695457
2019-02-05	JPY	125.441979
2019-02-06	CNY	7.6659
2019-02-06	JPY	125.003813
2019-02-07	CNY	7.647506
2019-02-07	JPY	124.449475
2019-02-08	CNY	7.645567
2019-02-08	JPY	124.392321
2019-02-09	CNY	7.645567
2019-02-09	JPY	124.390054
2019-02-10	CNY	7.63773
2019-02-10	JPY	124.353138
2019-02-08	USD	1.133549
2019-02-08	RUB	74.200201
2019-02-09	USD	1.133549
2019-02-09	RUB	74.200201
2019-02-10	USD	1.132387
2019-02-10	RUB	74.098104
2019-02-01	USD	1.145744
2019-02-01	RUB	74.994745
2019-02-02	USD	1.145744
2019-02-02	RUB	74.994745
2019-02-03	USD	1.145482
2019-02-03	RUB	75.013948
2019-02-04	USD	1.143583
2019-02-04	RUB	74.991905
2019-02-05	USD	1.140947
2019-02-05	RUB	74.894152
2019-02-06	USD	1.136564
2019-02-06	RUB	74.800101
2019-02-07	USD	1.133838
2019-02-07	RUB	74.752458
\.


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (currency_date, currency);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

