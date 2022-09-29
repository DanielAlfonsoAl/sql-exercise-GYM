drop database if exists gym;
create database gym;
use gym;
-- se crea tabla instructores
CREATE TABLE INSTRUCTORES(
id_I varchar(20) primary key,
nombre_I varchar(20) not null,
telefono_I  varchar(15) not null
);

-- se crea tabla cliente
CREATE TABLE CLIENTE(
id_C varchar(20) primary key,
nombre_C varchar(20) not null,
apellido_C varchar(20) not null,
correo_C varchar(100) not null,
contraseña_C varchar(100) not null,
telefono_C  varchar(15) not null
);
-- se crea tabla maquinas
CREATE TABLE MAQUINAS(
id_M varchar(20) primary key,
nombre_M varchar(20) not null,
estado varchar(20) not null
);

-- se crea tabla HORARIOS
CREATE TABLE HORARIOS(
id_H varchar(20) primary key,
fecha_H date not null,
hora_H time  not null,
id_M_H_F varchar(20),
foreign key (id_M_H_F) references MAQUINAS (id_M)
);

-- se crea tabla RESERVA

CREATE TABLE RESERVA(
id_R varchar(20) primary key,
id_I_F varchar(20) not null,
id_C_F varchar(20) not null,
foreign key (id_I_F) references INSTRUCTORES (id_I),
foreign key (id_C_F) references CLIENTE (id_C)
);


-- tabla úente de reserva a maquinas

CREATE TABLE RESERVA_MAQUNAS(
id_RM varchar(20) primary key,
id_R_F varchar(20) not null,
id_M_F varchar(20) not null,
foreign key (id_R_F) references RESERVA (id_R),
foreign key (id_M_F) references MAQUINAS (id_M)
);

-- inserciones en Instructores

INSERT INTO INSTRUCTORES (id_I, nombre_I, telefono_I) 
VALUES ("1" , "julio" , "3214567896"),
	   ("2" , "felipe" , "3114527896"),
       ("3" , "camila" , "3102354785"),
       ("4" , "andres" , "3127845171"),
       ("5" , "sebastian" , "3124507820"),
       ("6" , "carlos" , "3204517128"),
       ("7" , "sara" , "3122506089"),
       ("8" , "steven" , "3214506230"),
       ("9" , "albeiro" , "3107805290"),
       ("10" , "jhon" , "3206704530");



-- inserciones en Cliente

INSERT INTO CLIENTE (id_C , nombre_C, apellido_C, correo_C, contraseña_C, telefono_C) 
VALUES ("1" , "daniel" , "alfonso" , "correo1@gmail.com" , "contraseña1" , "3214567886"),
	   ("2" , "sebastian" , "garcia" , "correo2@gmail.com" , "contraseña2", "3104562886"),
       ("3" , "danilo" , "alvarez" , "correo3@gmail.com" , "contraseña3" , "3124543886"),
       ("4" , "samuel" , "perez" , "correo4@gmail.com" , "contraseña4" , "3104334886"),
       ("5" , "ricardo" , "pacheco" , "correo5@gmail.com" , "contraseña5" , "3114347886"),
       ("6" , "stiven" , "osorio" , "correo6@gmail.com" , "contraseña6" , "3214567886"),
       ("7" , "vannesa" , "mosquera" , "correo7@gmail.com" , "contraseña7" , "3124567832"),
       ("8" , "edwin" , "narvaez" , "correo8@gmail.com" , "contraseña8" , "3112806786"),
       ("9" , "oscar" , "ramirez" , "correo9@gmail.com" , "contraseña9" , "3214567886"),
       ("10" , "daniel" , "estrada" , "correo10@gmail.com" , "contraseña10" , "3104567886");
       
       
-- inserciones en Maquinas

INSERT INTO MAQUINAS (id_M, nombre_M , estado) 
VALUES ("1" , "press banca" , "ocupado"),
	   ("2" , "barra" , "disponible"),
       ("3" , "caminadora" , "disponible"),
       ("4" , "multifuncional" , "ocupado"),
       ("5" , "Elíptica" , "disponible"),
       ("6" , "Remo" , "ocupado"),
       ("7" , "Prensa de Piernas" , "disponible"),
       ("8" , "Bicicleta Vertical" , "ocupado"),
       ("9" , "Máquina de Poleas" , "disponible"),
       ("10" , "hip tros" , "ocupado");


-- inserciones en Horarios

INSERT INTO HORARIOS (id_H , fecha_H , hora_H , id_M_H_F) 
VALUES ("1" , "2022-09-28" , "12:30" , "1"),
	   ("2" , "2022-09-27" , "11:30" , "2"),
       ("3" , "2022-09-25" , "10:30" , "3"),
       ("4" , "2022-09-26" , "09:30" , "4"),
       ("5" , "2022-09-21" , "08:30" , "5"),
       ("6" , "2022-09-24" , "07:30" , "6"),
       ("7" , "2022-09-23" , "06:30" , "7"),
       ("8" , "2022-09-21" , "05:30" , "8"),
       ("9" , "2022-09-27" , "04:30" , "9"),
       ("10" , "2022-09-26" , "03:30" , "10");


-- inserciones en Reserva

INSERT INTO RESERVA (id_R, id_I_F, id_C_F) 
VALUES ("1","1","3"),
	   ("2","3","4"),
       ("3","2","5"),
       ("4","6","6"),
       ("5","7","7"),
       ("6","4","8"),
       ("7","9","9"),
       ("8","2","10"),
       ("9","8","1"),
       ("10","5","2");
       
-- inserciones en Reserva_Maquinas

INSERT INTO RESERVA_MAQUNAS (id_RM , id_R_F , id_M_F)
VALUES ("1","1","2"),
	   ("2","2","4"),
       ("3","3","7"),
       ("4","4","6"),
       ("5","5","3"),
       ("6","6","8"),
       ("7","7","9"),
       ("8","8","1"),
       ("9","9","10"),
       ("10","10","5");
       
       
-- consultas 
-- 1
SELECT nombre_M , estado FROM MAQUINAS WHERE estado like "%disponible%";
-- 2
SELECT nombre_M as Maquina , fecha_H , hora_H FROM MAQUINAS INNER JOIN HORARIOS ON id_M = id_M_H_F WHERE estado like "%disponible%";
-- 3
SELECT nombre_C  as "nombre cliente ", nombre_M as Maquina , nombre_I as "Instructor a cargo" , fecha_H FROM INSTRUCTORES INNER JOIN RESERVA on id_I = id_I_F INNER JOIN CLIENTE ON id_C = id_C_F INNER JOIN RESERVA_MAQUNAS ON id_R = id_R_F INNER JOIN MAQUINAS ON id_M_F = id_M INNER JOIN HORARIOS ON  id_M_H_F  = id_M ;
-- 4
SELECT nombre_C  as "nombre cliente" , nombre_I as "Instructor a cargo" FROM INSTRUCTORES INNER JOIN RESERVA ON id_I = id_I_F INNER JOIN CLIENTE ON  id_C_F = id_C ;
