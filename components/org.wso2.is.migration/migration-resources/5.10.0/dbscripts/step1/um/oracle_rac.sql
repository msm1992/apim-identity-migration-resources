CREATE TABLE IF NOT EXISTS UM_UUID_DOMAIN_MAPPER (
            UM_ID INTEGER,
            UM_USER_ID VARCHAR(255) NOT NULL,
            UM_DOMAIN_ID INTEGER NOT NULL,
            UM_TENANT_ID INTEGER DEFAULT 0,
            PRIMARY KEY (UM_ID),
            UNIQUE (UM_USER_ID),
            FOREIGN KEY (UM_DOMAIN_ID, UM_TENANT_ID) REFERENCES UM_DOMAIN(UM_DOMAIN_ID, UM_TENANT_ID) ON DELETE CASCADE
)
/

CREATE SEQUENCE UM_UUID_DOMAIN_MAPPER_SEQUENCE START WITH 1 INCREMENT BY 1 NOCACHE

/
CREATE OR REPLACE TRIGGER UM_UUID_DOMAIN_MAPPER_TRIGGER
                    BEFORE INSERT
                    ON UM_UUID_DOMAIN_MAPPER
                    REFERENCING NEW AS NEW
                    FOR EACH ROW
                    BEGIN
                    SELECT UM_UUID_DOMAIN_MAPPER_SEQUENCE.nextval INTO :NEW.UM_ID FROM dual;
              END;
/

CREATE INDEX UUID_DM_UID_TID ON UM_UUID_DOMAIN_MAPPER(UM_USER_ID, UM_TENANT_ID)
/
