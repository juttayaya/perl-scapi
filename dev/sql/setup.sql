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

# Example for parent-child 1-to-many
CREATE TABLE IF NOT EXISTS study (
    id int(11) NOT NULL AUTO_INCREMENT,
    name varchar(64) CHARACTER SET utf8 NOT NULL,
    project_id int(11) NOT NULL,
    CONSTRAINT study_pk_id PRIMARY KEY (id),
    INDEX study_idx_project_id (project_id),
    CONSTRAINT study_fk_project_id FOREIGN KEY (project_id)
        REFERENCES project(id)
        ON DELETE CASCADE
) DEFAULT CHARSET=utf8;

# Example for many-to-many relationships
CREATE TABLE IF NOT EXISTS gene_mutation (
    id int(11) NOT NULL AUTO_INCREMENT,
    name varchar(64) CHARACTER SET utf8 NOT NULL,
    CONSTRAINT gene_mutation_pk_id PRIMARY KEY (id)
) DEFAULT CHARSET=utf8;

insert into gene_mutation(name) VALUES ('BRCA1');
insert into gene_mutation(name) VALUES ('BRCA2');
insert into gene_mutation(name) VALUES ('KRAS');
insert into gene_mutation(name) VALUES ('EGFR');
insert into gene_mutation(name) VALUES ('PTEN');
insert into gene_mutation(name) VALUES ('BRAF');

CREATE TABLE study_gene_mutation (
   study_id int(11) NOT NULL,
   gene_mutation_id int(11) NOT NULL,
   CONSTRAINT study_gene_mutation_pk PRIMARY KEY (study_id,gene_mutation_id),
   CONSTRAINT study_gene_mutation_fk_study_id FOREIGN KEY (study_id)
       REFERENCES study(id)
       ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT study_gene_mutation_fk_gm_id FOREIGN KEY (gene_mutation_id)
           REFERENCES gene_mutation(id)
           ON DELETE CASCADE ON UPDATE CASCADE
);

commit ;
