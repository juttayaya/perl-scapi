create database scapi_db;

grant all privileges on scapi_db.* to scapi_user identified by 'PASSWORD_NOT_CHECKED_IN';
flush privileges ;

CREATE TABLE IF NOT EXISTS project (
    id int(11) NOT NULL AUTO_INCREMENT,
    name varchar(64) CHARACTER SET utf8 NOT NULL,
    CONSTRAINT project_pk_id PRIMARY KEY (id)
) DEFAULT CHARSET=utf8;

INSERT INTO project(name) VALUES ('Jirawat Project');
INSERT INTO project(name) VALUES ('Study Uttayaya');
INSERT INTO project(name) VALUES ('Demo');

commit ;
