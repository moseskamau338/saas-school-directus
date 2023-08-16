-- -------------------------------------------------------------
-- TablePlus 5.4.0(504)
--
-- https://tableplus.com/
--
-- Database: nyumbani
-- Generation Time: 2023-08-16 09:34:47.9190
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."academic_sessions";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."academic_sessions" (
    "id" uuid NOT NULL,
    "status" varchar(255) NOT NULL DEFAULT 'draft'::character varying,
    "sort" int4,
    "user_created" uuid,
    "date_created" timestamptz,
    "user_updated" uuid,
    "date_updated" timestamptz,
    "curriculum" uuid,
    "level" varchar(255),
    "start_date" date,
    "end_date" date,
    "term" varchar(255),
    "school_year" varchar(255),
    "account" uuid,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."accounts";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."accounts" (
    "id" uuid NOT NULL,
    "status" varchar(255) NOT NULL DEFAULT 'draft'::character varying,
    "user_created" uuid,
    "date_created" timestamptz,
    "user_updated" uuid,
    "date_updated" timestamptz,
    "name" varchar(255),
    "slug" varchar(255) DEFAULT NULL::character varying,
    "type" varchar(255),
    "location" geometry(Point,4326),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."curriculum";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."curriculum" (
    "id" uuid NOT NULL,
    "status" varchar(255) NOT NULL DEFAULT 'draft'::character varying,
    "user_created" uuid,
    "date_created" timestamptz,
    "user_updated" uuid,
    "date_updated" timestamptz,
    "name" varchar(255),
    "description" text,
    "account" uuid,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."examinations";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."examinations" (
    "id" uuid NOT NULL,
    "status" varchar(255) NOT NULL DEFAULT 'draft'::character varying,
    "user_created" uuid,
    "date_created" timestamptz,
    "user_updated" uuid,
    "date_updated" timestamptz,
    "academic_session" uuid,
    "name" varchar(255),
    "date" date,
    "total_marks" varchar(255),
    "account" uuid,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."grading_presets";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."grading_presets" (
    "id" uuid NOT NULL,
    "status" varchar(255) NOT NULL DEFAULT 'draft'::character varying,
    "user_created" uuid,
    "date_created" timestamptz,
    "user_updated" uuid,
    "date_updated" timestamptz,
    "name" varchar(255),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."grading_scales";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."grading_scales" (
    "id" uuid NOT NULL,
    "user_created" uuid,
    "date_created" timestamptz,
    "user_updated" uuid,
    "date_updated" timestamptz,
    "grading_preset" uuid,
    "grade" varchar(255),
    "score_start" float4,
    "score_end" float4,
    "account" uuid,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."membership";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."membership" (
    "id" uuid NOT NULL,
    "status" varchar(255) NOT NULL DEFAULT 'draft'::character varying,
    "user_created" uuid,
    "date_created" timestamptz,
    "user_updated" uuid,
    "date_updated" timestamptz,
    "user" uuid,
    "account" uuid,
    "role" varchar(255),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."student_kins";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."student_kins" (
    "id" uuid NOT NULL,
    "status" varchar(255) NOT NULL DEFAULT 'draft'::character varying,
    "user_created" uuid,
    "date_created" timestamptz,
    "user_updated" uuid,
    "date_updated" timestamptz,
    "guardian_name" varchar(255),
    "relation" varchar(255),
    "students" uuid,
    "user" uuid,
    "account" uuid,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."student_performance";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."student_performance" (
    "id" uuid NOT NULL,
    "user_created" uuid,
    "date_created" timestamptz,
    "user_updated" uuid,
    "date_updated" timestamptz,
    "student" uuid,
    "exammination" uuid,
    "subject" uuid,
    "marks" float4,
    "grade" varchar(255),
    "account" uuid,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."students";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."students" (
    "id" uuid NOT NULL,
    "status" varchar(255) NOT NULL DEFAULT 'draft'::character varying,
    "user_created" uuid,
    "date_created" timestamptz,
    "user_updated" uuid,
    "date_updated" timestamptz,
    "first_name" varchar(255),
    "second_name" varchar(255) DEFAULT NULL::character varying,
    "joining_date" timestamp,
    "account" uuid,
    "date_of_birth" date,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."subjects";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."subjects" (
    "id" uuid NOT NULL,
    "user_created" uuid,
    "date_created" timestamptz,
    "user_updated" uuid,
    "date_updated" timestamptz,
    "curriculum" uuid,
    "name" varchar(255),
    "descripiton" text,
    "grading_preset" uuid,
    "account" uuid,
    PRIMARY KEY ("id")
);


ALTER TABLE "public"."academic_sessions" ADD FOREIGN KEY ("user_created") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."academic_sessions" ADD FOREIGN KEY ("user_updated") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."academic_sessions" ADD FOREIGN KEY ("account") REFERENCES "public"."accounts"("id") ON DELETE SET NULL;
ALTER TABLE "public"."academic_sessions" ADD FOREIGN KEY ("curriculum") REFERENCES "public"."curriculum"("id") ON DELETE SET NULL;
ALTER TABLE "public"."accounts" ADD FOREIGN KEY ("user_created") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."accounts" ADD FOREIGN KEY ("user_updated") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."curriculum" ADD FOREIGN KEY ("user_updated") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."curriculum" ADD FOREIGN KEY ("account") REFERENCES "public"."accounts"("id") ON DELETE SET NULL;
ALTER TABLE "public"."curriculum" ADD FOREIGN KEY ("user_created") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."examinations" ADD FOREIGN KEY ("academic_session") REFERENCES "public"."academic_sessions"("id") ON DELETE SET NULL;
ALTER TABLE "public"."examinations" ADD FOREIGN KEY ("account") REFERENCES "public"."accounts"("id") ON DELETE SET NULL;
ALTER TABLE "public"."examinations" ADD FOREIGN KEY ("user_created") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."examinations" ADD FOREIGN KEY ("user_updated") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."grading_presets" ADD FOREIGN KEY ("user_created") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."grading_presets" ADD FOREIGN KEY ("user_updated") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."grading_scales" ADD FOREIGN KEY ("user_updated") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."grading_scales" ADD FOREIGN KEY ("grading_preset") REFERENCES "public"."grading_presets"("id") ON DELETE SET NULL;
ALTER TABLE "public"."grading_scales" ADD FOREIGN KEY ("user_created") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."grading_scales" ADD FOREIGN KEY ("account") REFERENCES "public"."accounts"("id") ON DELETE SET NULL;
ALTER TABLE "public"."membership" ADD FOREIGN KEY ("user") REFERENCES "public"."directus_users"("id") ON DELETE SET NULL;
ALTER TABLE "public"."membership" ADD FOREIGN KEY ("user_updated") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."membership" ADD FOREIGN KEY ("account") REFERENCES "public"."accounts"("id") ON DELETE SET NULL;
ALTER TABLE "public"."membership" ADD FOREIGN KEY ("user_created") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."student_kins" ADD FOREIGN KEY ("students") REFERENCES "public"."students"("id") ON DELETE SET NULL;
ALTER TABLE "public"."student_kins" ADD FOREIGN KEY ("account") REFERENCES "public"."accounts"("id") ON DELETE SET NULL;
ALTER TABLE "public"."student_kins" ADD FOREIGN KEY ("user") REFERENCES "public"."directus_users"("id") ON DELETE SET NULL;
ALTER TABLE "public"."student_kins" ADD FOREIGN KEY ("user_updated") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."student_kins" ADD FOREIGN KEY ("user_created") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."student_performance" ADD FOREIGN KEY ("exammination") REFERENCES "public"."examinations"("id") ON DELETE SET NULL;
ALTER TABLE "public"."student_performance" ADD FOREIGN KEY ("user_updated") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."student_performance" ADD FOREIGN KEY ("subject") REFERENCES "public"."subjects"("id") ON DELETE SET NULL;
ALTER TABLE "public"."student_performance" ADD FOREIGN KEY ("user_created") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."student_performance" ADD FOREIGN KEY ("student") REFERENCES "public"."students"("id") ON DELETE SET NULL;
ALTER TABLE "public"."student_performance" ADD FOREIGN KEY ("account") REFERENCES "public"."accounts"("id") ON DELETE SET NULL;
ALTER TABLE "public"."students" ADD FOREIGN KEY ("user_created") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."students" ADD FOREIGN KEY ("user_updated") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."students" ADD FOREIGN KEY ("account") REFERENCES "public"."accounts"("id") ON DELETE SET NULL;
ALTER TABLE "public"."subjects" ADD FOREIGN KEY ("curriculum") REFERENCES "public"."curriculum"("id") ON DELETE SET NULL;
ALTER TABLE "public"."subjects" ADD FOREIGN KEY ("user_created") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."subjects" ADD FOREIGN KEY ("user_updated") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."subjects" ADD FOREIGN KEY ("grading_preset") REFERENCES "public"."grading_presets"("id") ON DELETE SET NULL;
ALTER TABLE "public"."subjects" ADD FOREIGN KEY ("account") REFERENCES "public"."accounts"("id") ON DELETE SET NULL;
