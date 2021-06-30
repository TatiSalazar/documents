-- create database vuelopruebadb;
use vuelopruebadb;

-- CREATE TABLE aeropuerto (
--    id_aeropuerto      INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
--    nombre_aeropuerto  VARCHAR(50) NOT NULL,
--    numero_de_pistas   INTEGER NOT NULL,
--    aeropuerto_activo  VARCHAR(2) NOT NULL
-- );

-- ALTER TABLE aeropuerto ADD CONSTRAINT aeropuerto_pk PRIMARY KEY ( id_aeropuerto );

CREATE TABLE avion (
    id_avion                  INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    aeropuerto_id_aeropuerto  INTEGER NOT NULL,
    compania_id_compania      INTEGER NOT NULL
);

-- ALTER TABLE avion ADD CONSTRAINT avion_pk PRIMARY KEY ( id_avion );

CREATE TABLE compania (
    id_compania      INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre_compania  VARCHAR(50) NOT NULL
);

-- ALTER TABLE compania ADD CONSTRAINT compania_pk PRIMARY KEY ( id_compania );

CREATE TABLE destino (
    id_destino         INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre_aeropuerto  VARCHAR(50) NOT NULL,
    nombre_ciudad      VARCHAR(100) NOT NULL
);

-- ALTER TABLE destino ADD CONSTRAINT destino_pk PRIMARY KEY ( id_destino );

CREATE TABLE itinerario (
    id_itinerario       INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    fecha_salida        DATE DEFAULT '0000-00-00',
    fecha_llegada       DATE DEFAULT '0000-00-00',
    destino_id_destino  INTEGER NOT NULL,
    origen_id_origen    INTEGER NOT NULL
);

-- TABLE itinerario ADD CONSTRAINT itinerario_pk PRIMARY KEY ( id_itinerario );

CREATE TABLE origen (
    id_origen          INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre_aeropuerto  VARCHAR(50) NOT NULL,
    nombre_ciudad      VARCHAR(100) NOT NULL
);

-- ALTER TABLE origen ADD CONSTRAINT origen_pk PRIMARY KEY ( id_origen );

CREATE TABLE pasaje (
    id_pasaje       INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    clase           VARCHAR(30) NOT NULL,
    asiento         VARCHAR(15) NOT NULL,
    valor           DECIMAL(10,2) NOT NULL,
    pasajero_id     INTEGER NOT NULL,
    vuelo_id_vuelo  INTEGER NOT NULL
);

-- ALTER TABLE pasaje ADD CONSTRAINT pasaje_pk PRIMARY KEY ( id_pasaje );

CREATE TABLE pasajero (
    id         INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre     VARCHAR(30) NOT NULL,
    documento  VARCHAR(15) NOT NULL,
    edad       VARCHAR(15) NOT NULL,
    email      VARCHAR(30) ,
    telefono   VARCHAR(30) 
);

-- ALTER TABLE pasajero ADD CONSTRAINT pasajero_pk PRIMARY KEY ( id );

CREATE TABLE vuelo (
    id_vuelo                  INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    capacidad                 VARCHAR(10),
    numerovuelo               VARCHAR(10),
    compania_id_compania      INTEGER NOT NULL,
    itinerario_id_itinerario  INTEGER NOT NULL,
    aeropuerto_id_aeropuerto  INTEGER NOT NULL,
    avion_id_avion            INTEGER NOT NULL
);

-- ALTER TABLE vuelo ADD CONSTRAINT vuelo_pk PRIMARY KEY ( id_vuelo );

ALTER TABLE avion
    ADD CONSTRAINT avion_aeropuerto_fk FOREIGN KEY ( aeropuerto_id_aeropuerto )
        REFERENCES aeropuerto ( id_aeropuerto );

ALTER TABLE avion
    ADD CONSTRAINT avion_compania_fk FOREIGN KEY ( compania_id_compania )
        REFERENCES compania ( id_compania );

ALTER TABLE itinerario
    ADD CONSTRAINT itinerario_destino_fk FOREIGN KEY ( destino_id_destino )
        REFERENCES destino ( id_destino );

ALTER TABLE itinerario
    ADD CONSTRAINT itinerario_origen_fk FOREIGN KEY ( origen_id_origen )
        REFERENCES origen ( id_origen );

ALTER TABLE pasaje
    ADD CONSTRAINT pasaje_pasajero_fk FOREIGN KEY ( pasajero_id )
        REFERENCES pasajero ( id );

ALTER TABLE pasaje
    ADD CONSTRAINT pasaje_vuelo_fk FOREIGN KEY ( vuelo_id_vuelo )
        REFERENCES vuelo ( id_vuelo );

ALTER TABLE vuelo
    ADD CONSTRAINT vuelo_avion_fk FOREIGN KEY ( avion_id_avion )
        REFERENCES avion ( id_avion );

ALTER TABLE vuelo
    ADD CONSTRAINT vuelo_compania_fk FOREIGN KEY ( compania_id_compania )
        REFERENCES compania ( id_compania );

ALTER TABLE vuelo
    ADD CONSTRAINT vuelo_itinerario_fk FOREIGN KEY ( itinerario_id_itinerario )
        REFERENCES itinerario ( id_itinerario );

