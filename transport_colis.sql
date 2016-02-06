/*==============================================================*/
/* Nom de SGBD :  MySQL 4.0                                     */
/* Date de création :  06/02/2016 10:46:57                      */
/*==============================================================*/


/*drop index RELATION_2_FK on COLIS;

drop index RELATION_1_FK on COMMENT;

drop index RELATION_5_FK on COMMENT;

drop index RELATION_3_FK on VOYAGE;

drop index RELATION_4_FK on VOYAGE;

drop index RELATION_6_FK on VOYAGE;

drop table if exists COLIS;

drop table if exists COMMENT;

drop table if exists LIEU;

drop table if exists USER;

drop table if exists VOYAGE;
*/
/*==============================================================*/
/* Table : COLIS                                                */
/*==============================================================*/
create table COLIS
(
   NUM_COLIS                      bigint                         not null,
   NUM_USER                       bigint,
   DEPART                         varchar(100),
   ARRIVEE                        varchar(100),
   primary key (NUM_COLIS)
)
type = InnoDB;

/*==============================================================*/
/* Index : RELATION_2_FK                                        */
/*==============================================================*/
create index RELATION_2_FK on COLIS
(
   NUM_USER
);

/*==============================================================*/
/* Table : COMMENT                                              */
/*==============================================================*/
create table COMMENT
(
   NUM_COMMENT                    bigint                         not null,
   NUM_VOYAGE                     bigint,
   NUM_USER                       bigint,
   MESSAGE                        text,
   primary key (NUM_COMMENT)
)
type = InnoDB;

/*==============================================================*/
/* Index : RELATION_1_FK                                        */
/*==============================================================*/
create index RELATION_1_FK on COMMENT
(
   NUM_USER
);

/*==============================================================*/
/* Index : RELATION_5_FK                                        */
/*==============================================================*/
create index RELATION_5_FK on COMMENT
(
   NUM_VOYAGE
);

/*==============================================================*/
/* Table : LIEU                                                 */
/*==============================================================*/
create table LIEU
(
   NUM_LIEU                       bigint                         not null,
   PAYS                           varchar(100),
   VILLE                          varchar(100),
   primary key (NUM_LIEU)
)
type = InnoDB;

/*==============================================================*/
/* Table : USER                                                 */
/*==============================================================*/
create table USER
(
   NUM_USER                       bigint                         not null,
   NOM                            varchar(100),
   PRENOM                         varchar(100),
   BIRTH_DATE                     date,
   RIB                            varchar(200),
   ADRESSE1                       varchar(200),
   ADRESSE2                       varchar(200),
   primary key (NUM_USER)
)
type = InnoDB;

/*==============================================================*/
/* Table : VOYAGE                                               */
/*==============================================================*/
create table VOYAGE
(
   NUM_VOYAGE                     bigint                         not null,
   NUM_COLIS                      bigint,
   NUM_LIEU                       bigint,
   NUM_USER                       bigint,
   DEPART                         varchar(100),
   ARRIVEE                        varchar(100),
   KILOS                          int,
   DEPART_DATE                    date,
   primary key (NUM_VOYAGE)
)
type = InnoDB;

/*==============================================================*/
/* Index : RELATION_3_FK                                        */
/*==============================================================*/
create index RELATION_3_FK on VOYAGE
(
   NUM_USER
);

/*==============================================================*/
/* Index : RELATION_4_FK                                        */
/*==============================================================*/
create index RELATION_4_FK on VOYAGE
(
   NUM_LIEU
);

/*==============================================================*/
/* Index : RELATION_6_FK                                        */
/*==============================================================*/
create index RELATION_6_FK on VOYAGE
(
   NUM_COLIS
);

alter table COLIS add constraint FK_RELATION_2 foreign key (NUM_USER)
      references USER (NUM_USER) on delete restrict on update restrict;

alter table COMMENT add constraint FK_RELATION_1 foreign key (NUM_USER)
      references USER (NUM_USER) on delete restrict on update restrict;

alter table COMMENT add constraint FK_RELATION_5 foreign key (NUM_VOYAGE)
      references VOYAGE (NUM_VOYAGE) on delete restrict on update restrict;

alter table VOYAGE add constraint FK_RELATION_3 foreign key (NUM_USER)
      references USER (NUM_USER) on delete restrict on update restrict;

alter table VOYAGE add constraint FK_RELATION_4 foreign key (NUM_LIEU)
      references LIEU (NUM_LIEU) on delete restrict on update restrict;

alter table VOYAGE add constraint FK_RELATION_6 foreign key (NUM_COLIS)
      references COLIS (NUM_COLIS) on delete restrict on update restrict;

