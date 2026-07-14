-- Supabase schema export for project zanibefrsyfnilrjcgrq (public schema)
-- Generated via Management API introspection.

CREATE TABLE IF NOT EXISTS "badges" (
  id character varying NOT NULL DEFAULT gen_random_uuid(),
  serial_number character varying(15) NOT NULL,
  status character varying(20) NOT NULL DEFAULT 'AVAILABLE'::character varying,
  owner_id character varying,
  purchased_at timestamp without time zone,
  work_title character varying(255),
  work_type character varying(50),
  work_description text,
  work_url character varying(500),
  ai_tools_used text[],
  creator_name character varying(255),
  show_name_publicly boolean DEFAULT false,
  registered_at timestamp without time zone,
  created_at timestamp without time zone NOT NULL DEFAULT now(),
  updated_at timestamp without time zone NOT NULL DEFAULT now(),
  tier character varying(10) NOT NULL DEFAULT 'PRO'::character varying
);
CREATE TABLE IF NOT EXISTS "contact_submissions" (
  id character varying NOT NULL DEFAULT gen_random_uuid(),
  name character varying(255) NOT NULL,
  email character varying(255) NOT NULL,
  subject character varying(255) DEFAULT 'General Inquiry'::character varying,
  message text NOT NULL,
  read boolean DEFAULT false,
  created_at timestamp without time zone NOT NULL DEFAULT now()
);
CREATE TABLE IF NOT EXISTS "purchases" (
  id character varying NOT NULL DEFAULT gen_random_uuid(),
  user_id character varying NOT NULL,
  stripe_session_id character varying(255),
  stripe_payment_intent_id character varying(255),
  quantity integer NOT NULL,
  amount_cents integer NOT NULL,
  status character varying(20) NOT NULL DEFAULT 'pending'::character varying,
  created_at timestamp without time zone NOT NULL DEFAULT now()
);
CREATE TABLE IF NOT EXISTS "sessions" (
  id character varying NOT NULL DEFAULT gen_random_uuid(),
  user_id character varying NOT NULL,
  expires_at timestamp without time zone NOT NULL,
  created_at timestamp without time zone NOT NULL DEFAULT now()
);
CREATE TABLE IF NOT EXISTS "users" (
  id character varying NOT NULL DEFAULT gen_random_uuid(),
  email character varying(255) NOT NULL,
  password_hash text NOT NULL,
  name character varying(255),
  is_admin boolean DEFAULT false,
  created_at timestamp without time zone NOT NULL DEFAULT now()
);

-- Constraints
ALTER TABLE badges ADD CONSTRAINT "badges_serial_number_key" UNIQUE (serial_number);
ALTER TABLE users ADD CONSTRAINT "users_email_key" UNIQUE (email);
ALTER TABLE users ADD CONSTRAINT "users_pkey" PRIMARY KEY (id);
ALTER TABLE contact_submissions ADD CONSTRAINT "contact_submissions_pkey" PRIMARY KEY (id);
ALTER TABLE purchases ADD CONSTRAINT "purchases_pkey" PRIMARY KEY (id);
ALTER TABLE badges ADD CONSTRAINT "badges_pkey" PRIMARY KEY (id);
ALTER TABLE sessions ADD CONSTRAINT "sessions_pkey" PRIMARY KEY (id);
ALTER TABLE purchases ADD CONSTRAINT "purchases_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;
ALTER TABLE badges ADD CONSTRAINT "badges_owner_id_fkey" FOREIGN KEY (owner_id) REFERENCES users(id) ON DELETE SET NULL;
ALTER TABLE sessions ADD CONSTRAINT "sessions_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;
-- Data export for zanibefrsyfnilrjcgrq (public schema)

-- badges (26 rows)
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('1f9cfaa8-60a0-46ba-8d54-c49df4dbca00', 'ACEA-56259-0983', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:08.541236', '2026-03-06 20:45:08.541236', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('9a388950-f0d5-4e90-b0a8-4a547b2e9872', 'ACEA-39037-5849', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:08.627562', '2026-03-06 20:45:08.627562', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('2c1ff105-5cf3-4a05-807b-9bfdf35c6f86', 'ACEA-46774-2981', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:08.709447', '2026-03-06 20:45:08.709447', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('c063d9a7-8b70-499d-86d4-083a2bd0cafe', 'ACEA-29755-3127', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:08.793774', '2026-03-06 20:45:08.793774', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('305c4a10-0718-4893-b81a-301dc85fffbb', 'ACEA-96328-5295', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:08.875528', '2026-03-06 20:45:08.875528', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('62388fa1-68a5-4637-adbd-f4c8812d6ea4', 'ACEA-98781-3864', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:08.957983', '2026-03-06 20:45:08.957983', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('f39d1745-e699-498e-87d8-f32fb5770f49', 'ACEA-46964-3982', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:09.071283', '2026-03-06 20:45:09.071283', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('32c8d578-b506-4442-8135-1477e1c491cc', 'ACEA-00563-2859', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:09.151126', '2026-03-06 20:45:09.151126', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('cea8277d-0393-487b-b550-1bca27f1c172', 'ACEA-73946-5131', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:09.231231', '2026-03-06 20:45:09.231231', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('d42b4e6f-92d5-4425-8128-008e21b235e3', 'ACEA-72117-1470', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:09.311499', '2026-03-06 20:45:09.311499', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('509fe170-c4c4-4bc9-b2b1-0238ac51d594', 'ACEA-33327-1032', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:09.391643', '2026-03-06 20:45:09.391643', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('5f092b52-6711-48cb-9598-22605e6f72f6', 'ACEA-86561-6900', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:09.473724', '2026-03-06 20:45:09.473724', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('d6474b76-7ea8-419a-8129-73466cc9e166', 'ACEA-86917-9970', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:09.593427', '2026-03-06 20:45:09.593427', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('b0e268a8-d749-4ba2-91e3-54c44fba6505', 'ACEA-49671-6180', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:09.675393', '2026-03-06 20:45:09.675393', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('e320c7f6-41c2-4f93-a6bc-a171d666c30e', 'ACEA-39730-6143', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:09.753536', '2026-03-06 20:45:09.753536', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('673ccf0e-4c4a-4c16-948a-13f9498a4964', 'ACEA-96423-7554', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:09.833652', '2026-03-06 20:45:09.833652', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('ca245682-b8e3-4936-9aa7-551403ca8065', 'ACEA-44997-3695', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:09.913711', '2026-03-06 20:45:09.913711', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('d49462bf-4c6c-4cae-9ac5-c06b9dac25b9', 'ACEA-21525-5009', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:09.995269', '2026-03-06 20:45:09.995269', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('120f19c7-878f-46d8-9d5c-608abaaf10d6', 'ACEA-26147-7898', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:10.113668', '2026-03-06 20:45:10.113668', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('8fbba57d-1f1f-4a5b-be4c-18601d81e5e8', 'ACEA-36304-6601', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:10.193891', '2026-03-06 20:45:10.193891', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('a2202836-951d-44b9-a0d7-be43230c7093', 'ACEA-69372-5202', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:10.273181', '2026-03-06 20:45:10.273181', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('26302c26-6d08-4f9d-9431-eff78b27b097', 'ACEA-11911-1061', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:10.355463', '2026-03-06 20:45:10.355463', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('450f4c66-b9a3-4a3f-b9f3-107b2a68994a', 'ACEA-56241-6810', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:10.43338', '2026-03-06 20:45:10.43338', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('348ce102-debe-487e-83c5-07c3e4f6d50a', 'ACEA-46005-5886', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:10.511414', '2026-03-06 20:45:10.511414', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('c4f6046c-a748-45ec-9f16-d5c794a6091a', 'ACEA-96482-4144', 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:45:10.635609', '2026-03-06 20:45:10.635609', 'PRO');
INSERT INTO public."badges" ("id", "serial_number", "status", "owner_id", "purchased_at", "work_title", "work_type", "work_description", "work_url", "ai_tools_used", "creator_name", "show_name_publicly", "registered_at", "created_at", "updated_at", "tier") VALUES ('ee0d42d7-188e-4505-885e-099788695874', 'ACEA-9P5VT-WZGX', 'OWNED', '2e22584d-ebb3-463b-aebe-7bb5f07a1bba', '2026-03-06 20:50:52.156', NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2026-03-06 20:50:52.167852', '2026-03-06 20:50:52.167852', 'FREE');

-- purchases (3 rows)
INSERT INTO public."purchases" ("id", "user_id", "stripe_session_id", "stripe_payment_intent_id", "quantity", "amount_cents", "status", "created_at") VALUES ('ed55fbc1-3ef3-49d2-83f7-2b04942b80e0', '2e22584d-ebb3-463b-aebe-7bb5f07a1bba', NULL, NULL, 1, 500, 'pending', '2026-03-06 20:50:51.800179');
INSERT INTO public."purchases" ("id", "user_id", "stripe_session_id", "stripe_payment_intent_id", "quantity", "amount_cents", "status", "created_at") VALUES ('23120719-f810-4dc0-b31e-e566d0141634', '2e22584d-ebb3-463b-aebe-7bb5f07a1bba', NULL, NULL, 1, 0, 'completed', '2026-03-06 20:50:52.185528');
INSERT INTO public."purchases" ("id", "user_id", "stripe_session_id", "stripe_payment_intent_id", "quantity", "amount_cents", "status", "created_at") VALUES ('9ca58ac2-278a-4ef2-88ac-51e1522673e3', '2e22584d-ebb3-463b-aebe-7bb5f07a1bba', 'cs_live_a1eyu9C184wxBJz19kqxgVLoaMBQ6VPc4L29jQta2D7X1GRKoJNyfB9NxW', NULL, 1, 500, 'pending', '2026-03-06 20:53:09.199794');

-- sessions (4 rows)
INSERT INTO public."sessions" ("id", "user_id", "expires_at", "created_at") VALUES ('f88d1cbf-8a2f-4a8c-a0c2-bed20b0be65f', '2e22584d-ebb3-463b-aebe-7bb5f07a1bba', '2026-03-13 20:50:51.425', '2026-03-06 20:50:51.437463');
INSERT INTO public."sessions" ("id", "user_id", "expires_at", "created_at") VALUES ('2aef6c5a-d050-411c-bc4f-0212c02256dc', '2e22584d-ebb3-463b-aebe-7bb5f07a1bba', '2026-03-13 20:53:08.87', '2026-03-06 20:53:08.884943');
INSERT INTO public."sessions" ("id", "user_id", "expires_at", "created_at") VALUES ('5d9ae3bc-0e22-411b-9790-fc68ba5e406b', '2e22584d-ebb3-463b-aebe-7bb5f07a1bba', '2026-04-11 19:46:51.513', '2026-04-04 19:46:51.519742');
INSERT INTO public."sessions" ("id", "user_id", "expires_at", "created_at") VALUES ('9ee9e611-2210-4356-9e5f-9fb1ce0e73e0', '2e22584d-ebb3-463b-aebe-7bb5f07a1bba', '2026-04-11 19:46:52.316', '2026-04-04 19:46:52.322485');

-- users (1 rows)
INSERT INTO public."users" ("id", "email", "password_hash", "name", "is_admin", "created_at") VALUES ('2e22584d-ebb3-463b-aebe-7bb5f07a1bba', 'iammvm1@gmail.com', '$2b$10$UJOE3RQcwr.FTcZLtXM/d.gV8xIEYZcz59Q5YXb.HwwwL1o6ktOte', 'Michael Moosbrugger', true, '2026-03-06 20:44:50.876283');
