DROP TABLE IF EXISTS UM_UUID_DOMAIN_MAPPER;
DROP SEQUENCE IF EXISTS UM_UUID_DOMAIN_MAPPER_PK_SEQ;
CREATE SEQUENCE UM_UUID_DOMAIN_MAPPER_PK_SEQ;
CREATE TABLE IF NOT EXISTS UM_UUID_DOMAIN_MAPPER (
            UM_ID INTEGER DEFAULT NEXTVAL('UM_HYBRID_REMEMBER_ME_PK_SEQ'),
            UM_USER_ID VARCHAR(255) NOT NULL,
            UM_DOMAIN_ID INTEGER NOT NULL,
            UM_TENANT_ID INTEGER DEFAULT 0,
            PRIMARY KEY (UM_ID),
            UNIQUE (UM_USER_ID),
            FOREIGN KEY (UM_DOMAIN_ID, UM_TENANT_ID) REFERENCES UM_DOMAIN(UM_DOMAIN_ID, UM_TENANT_ID) ON DELETE CASCADE
);

CREATE INDEX UUID_DM_UID_TID ON UM_UUID_DOMAIN_MAPPER(UM_USER_ID, UM_TENANT_ID);

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

ALTER TABLE UM_TENANT ADD COLUMN UM_TENANT_UUID VARCHAR(36) NOT NULL DEFAULT uuid_generate_v4();

ALTER TABLE UM_TENANT ADD UNIQUE (UM_TENANT_UUID);

