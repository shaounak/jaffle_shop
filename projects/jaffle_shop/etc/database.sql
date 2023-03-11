-- SQL dump generated using DBML (dbml-lang.org)
-- Database: PostgreSQL
-- Generated at: 2023-03-03T01:38:42.092Z
drop view if exists public.stg_customers;
drop view if exists public.stg_orders;
drop view if exists public.stg_payments;
drop table if exists public.customers;
drop table if exists public.orders;
drop table if exists public.payments;
drop table if exists public.raw_customers;
drop table if exists public.raw_orders;
drop table if exists public.raw_payments;
drop table if exists public."stg.raw_customers";
drop table if exists public."stg.raw_orders";
drop table if exists public."stg.raw_payments";
drop schema if exists staging cascade;
drop schema if exists stg cascade;
drop schema if exists _int cascade;
drop schema if exists public_stg cascade;
drop schema if exists public_mappings cascade;
drop schema if exists public_marketing cascade;
drop schema if exists public_seed_data cascade;
drop schema if exists stg_stg cascade;
CREATE SCHEMA if not exists "_int";
CREATE SCHEMA if not exists "stg";
create table if not exists "_int"."orders" (
  "id" int PRIMARY KEY,
  "user_id" int,
  "order_date" date,
  "status" varchar
);
create table if not exists "_int"."payments" (
  "id" int,
  "order_id" int,
  "payment_method" varchar,
  "amount" int
);
create table if not exists "_int"."customers" (
  "id" int PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar
);
create table if not exists "stg"."raw_orders" (
  "id" int PRIMARY KEY,
  "user_id" int,
  "order_date" date,
  "status" varchar
);
create table if not exists "stg"."raw_payments" (
  "id" int,
  "order_id" int,
  "payment_method" varchar,
  "amount" int
);
create table if not exists "stg"."raw_customers" (
  "id" int PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar
);
ALTER TABLE "_int"."orders"
ADD FOREIGN KEY ("user_id") REFERENCES "_int"."customers" ("id");
ALTER TABLE "_int"."payments"
ADD FOREIGN KEY ("order_id") REFERENCES "_int"."orders" ("id");