-- base de datos utilizada
create database obl2agosto2021
use obl2agosto2021;
set dateformat ymd;

------------------------------------------------------
-- creacion de tablas
------------------------------------------------------

create table Pais(
	IdPais decimal not null Primary Key,
	NombrePais varchar(50)
);

create table Pasajero (
	IdPasajero decimal not null Primary Key,
	NombrePasajero varchar(60),
	APaternoPasajero varchar(60),
	AMaternoPasajero varchar(60),
	TipoDocumentoPasajero char(3),
	NumeroDocumentoPasajero decimal,
	FechaNacimientoPasajero date,
	EmailPasajero varchar(60),
	PasswordPasajero character(40),
	IdPais decimal not null foreign key references Pais(IdPais)
);


create table PasajeroTelefono (
	IdPasajero decimal not null foreign key references Pasajero (IdPasajero),
	TelefonoPasajero varchar(60),
	primary Key (IdPasajero, TelefonoPasajero));


create table Terminal (
	IdTerminal decimal not null Primary Key,
	NombreTerminal varchar(60),
	IdPais decimal not null foreign key references Pais(IdPais));


create table bus (
	Idbus decimal not null Primary Key,
	Tipobus varchar(60),
	Capacidadbus integer,
	Marcabus varchar(80));


create table Asiento (
	Idbus decimal not null foreign key references bus (Idbus),
	FilaAsiento integer,
	LetraAsiento char(2),
	Primary Key (Idbus,FilaAsiento,LetraAsiento));


create table Viaje (
	IdTerminalOrigenViaje decimal not null foreign key references Terminal (IdTerminal),
	IdTerminalDestinoViaje decimal not null foreign key references Terminal (IdTerminal),
	FechaHoraViaje datetime,
	Importe float,
	Idbus decimal foreign key references bus (Idbus),
	IdViaje decimal not null Primary Key);

create table Boleto (
	IdPasajero decimal not null foreign key references Pasajero (IdPasajero),
	Idbus decimal not null foreign key references bus (Idbus),
	FilaAsiento integer,
	LetraAsiento char(2),
	FechaCompraBoleto date,
	IdViaje decimal not null foreign key references Viaje (IdViaje),
	Foreign key (Idbus,FilaAsiento,LetraAsiento) references Asiento(Idbus,FilaAsiento,LetraAsiento));


create table PasajeroMercoSur (
	IdPasajero decimal not null foreign key references Pasajero (IdPasajero),
	PorcentajePasajeroMercoSur float,
	Primary Key (IdPasajero));

create table PasajeroMercoSurBeneficio (
	IdPasajero decimal not null foreign key references Pasajero (IdPasajero),
	BeneficioMercoSur varchar(80),
	Primary Key (IdPasajero,BeneficioMercoSur));

 ------------------------------------------------------------------------------------------------------
-- Drop de tablas
------------------------------------------------------------------------------------------------------

--drop table Pais
--drop table Pasajero
--drop table PasajeroTelefono
--drop table Terminal
--drop table bus
--drop table Asiento;
--drop table Viaje;
--drop table Boleto;
--drop table PasajeroMercoSur
--drop table PasajeroMercoSurBeneficio

------------------------------------------------------
-- creacion de juego de prueba
------------------------------------------------------
-- Insert de pais
insert into Pais (IdPais,NombrePais) values(1,'Argentina');
insert into Pais (IdPais,NombrePais) values(2,'Brasil');
insert into Pais (IdPais,NombrePais) values(3,'Uruguay');
insert into Pais (IdPais,NombrePais) values(4,'Colombia');
insert into Pais (IdPais,NombrePais) values(5,'Ecuador ');
insert into Pais (IdPais,NombrePais) values(6,'Holanda');
insert into Pais (IdPais,NombrePais) values(7,'Alemania');
insert into Pais (IdPais,NombrePais) values(8,'Espa�a');
insert into Pais (IdPais,NombrePais) values(9,'Japon');
insert into Pais (IdPais,NombrePais) values(10,'China');


-- Insert de pasajeros

insert into Pasajero (IdPasajero, NombrePasajero, APaternoPasajero, AMaternoPasajero, TipoDocumentoPasajero, NumeroDocumentoPasajero, FechaNacimientoPasajero, EmailPasajero, PasswordPasajero, IdPais) values (1, 'Juan', 'Perez', 'Gomez', 'ci', 1234567, '2000-11-23', 'soyturista@gmail.com', 'turista1', 1);

insert into Pasajero (IdPasajero, NombrePasajero, APaternoPasajero, AMaternoPasajero, TipoDocumentoPasajero, NumeroDocumentoPasajero, FechaNacimientoPasajero, EmailPasajero, PasswordPasajero,IdPais) values  (2, 'Pedro', 'Picapiedra', 'Gomez', 'ci', 1234568, '1998-5-3', 'pedro@gmail.com', 'turista2', 3);

insert into Pasajero (IdPasajero, NombrePasajero, APaternoPasajero, AMaternoPasajero, TipoDocumentoPasajero, NumeroDocumentoPasajero, FechaNacimientoPasajero, EmailPasajero, PasswordPasajero, IdPais) values (3, 'Pablo', 'Marmol', 'Gomez', 'ci', 1234569, '2001-1-2', 'pablo@gmail.com', 'turista3', 3);

insert into Pasajero (IdPasajero, NombrePasajero, APaternoPasajero, AMaternoPasajero, TipoDocumentoPasajero, NumeroDocumentoPasajero, FechaNacimientoPasajero, EmailPasajero, PasswordPasajero, IdPais) values (4, 'Vilma', 'Perez', 'Gomez', 'ci', 1234561, '2005-1-23', 'vilma@gmail.com', 'turista4', 2);

insert into Pasajero (IdPasajero, NombrePasajero, APaternoPasajero, AMaternoPasajero, TipoDocumentoPasajero, NumeroDocumentoPasajero, FechaNacimientoPasajero, EmailPasajero, PasswordPasajero, IdPais) values (5, 'Juan', 'Martinez', 'Ya�ez', 'ci', 4897856, '1996-11-23', 'juanmartinez@gmail.com', 'turista5', 3);

insert into Pasajero (IdPasajero, NombrePasajero, APaternoPasajero, AMaternoPasajero, TipoDocumentoPasajero, NumeroDocumentoPasajero, FechaNacimientoPasajero, EmailPasajero, PasswordPasajero, IdPais) values (6, 'Andres', 'Mayes', 'Ferencz', 'ci', 4928922, '1999-06-01', 'andymayes@gmail.com', 'turista6', 10);

insert into Pasajero (IdPasajero, NombrePasajero, APaternoPasajero, AMaternoPasajero, TipoDocumentoPasajero, NumeroDocumentoPasajero, FechaNacimientoPasajero, EmailPasajero, PasswordPasajero, IdPais) values (7, 'Santiago', 'Risi', 'Fernandez', 'ci', 4631952, '1995-03-25', 'santirisi@gmail.com', 'turista7', 8);

insert into Pasajero (IdPasajero, NombrePasajero, APaternoPasajero, AMaternoPasajero, TipoDocumentoPasajero, NumeroDocumentoPasajero, FechaNacimientoPasajero, EmailPasajero, PasswordPasajero, IdPais) values (8, 'Ricardo', 'Fort', 'Gonzalez', 'ci', 1435543, '1958-02-22', 'riquiforchi@gmail.com', 'turisto', 8);

insert into Pasajero (IdPasajero, NombrePasajero, APaternoPasajero, AMaternoPasajero, TipoDocumentoPasajero, NumeroDocumentoPasajero, FechaNacimientoPasajero, EmailPasajero, PasswordPasajero, IdPais) values (9, 'Martin', 'Caceres', 'Ramirez', 'ci', 4758354, '1999-11-15', 'peladoca@gmail.com', 'turrista', 6);

insert into Pasajero (IdPasajero, NombrePasajero, APaternoPasajero, AMaternoPasajero, TipoDocumentoPasajero, NumeroDocumentoPasajero, FechaNacimientoPasajero, EmailPasajero, PasswordPasajero, IdPais) values (10, 'Felipe', 'Martinez', 'Morales', 'ci', 2347687, '1992-06-20', 'feli92@gmail.com', 'turistico', 4);

insert into Pasajero (IdPasajero, NombrePasajero, APaternoPasajero, AMaternoPasajero, TipoDocumentoPasajero, NumeroDocumentoPasajero, FechaNacimientoPasajero, EmailPasajero, PasswordPasajero, IdPais) values (11, 'Agustin', 'Gonzalez', 'Perez', 'ci', 4324324, '1997-05-28', 'agusgonzalez@gmail.com', 'turista11', 3);

insert into Pasajero (IdPasajero, NombrePasajero, APaternoPasajero, AMaternoPasajero, TipoDocumentoPasajero, NumeroDocumentoPasajero, FechaNacimientoPasajero, EmailPasajero, PasswordPasajero, IdPais) values (12, 'Maite', 'Lopez', 'Barletta', 'Pas', 5439356, '1999-06-10', 'maitelopez@gmail.com', 'turista12', 9);

insert into Pasajero (IdPasajero, NombrePasajero, APaternoPasajero, AMaternoPasajero, TipoDocumentoPasajero, NumeroDocumentoPasajero, FechaNacimientoPasajero, EmailPasajero, PasswordPasajero, IdPais) values (13, 'Camila', 'Vazquez', 'Garcia', 'Pas', 1238370, '1965-01-12', 'camilavazquez@gmail.com', 'turista13', 3);



-- Insert de telefonos de pasajeros
insert into PasajeroTelefono (IdPasajero,TelefonoPasajero) values(1, 091123482);
insert into PasajeroTelefono (IdPasajero,TelefonoPasajero) values(1, 091432183);
insert into PasajeroTelefono (IdPasajero,TelefonoPasajero) values(2, 092123484);
insert into PasajeroTelefono (IdPasajero,TelefonoPasajero) values(3, 093777785);
insert into PasajeroTelefono (IdPasajero,TelefonoPasajero) values(3, 093888886);
insert into PasajeroTelefono (IdPasajero,TelefonoPasajero) values(3, 093999987);
insert into PasajeroTelefono (IdPasajero,TelefonoPasajero) values(4, 093997888);
insert into PasajeroTelefono (IdPasajero,TelefonoPasajero) values(5, 093999989);
insert into PasajeroTelefono (IdPasajero,TelefonoPasajero) values(6, 093999990);
insert into PasajeroTelefono (IdPasajero,TelefonoPasajero) values(7, 093999991);
insert into PasajeroTelefono (IdPasajero,TelefonoPasajero) values(8, 093999992);
insert into PasajeroTelefono (IdPasajero,TelefonoPasajero) values(8, 093999993);
insert into PasajeroTelefono (IdPasajero,TelefonoPasajero) values(9, 093999994);
insert into PasajeroTelefono (IdPasajero,TelefonoPasajero) values(9, 093999995);
insert into PasajeroTelefono (IdPasajero,TelefonoPasajero) values(10, 093999996);
insert into PasajeroTelefono (IdPasajero,TelefonoPasajero) values(11, 093999997);
insert into PasajeroTelefono (IdPasajero,TelefonoPasajero) values(12, 093999998);
insert into PasajeroTelefono (IdPasajero,TelefonoPasajero) values(12, 093999999);
insert into PasajeroTelefono (IdPasajero,TelefonoPasajero) values(12, 093159357);
insert into PasajeroTelefono (IdPasajero,TelefonoPasajero) values(13, 093258369);
insert into PasajeroTelefono (IdPasajero,TelefonoPasajero) values(13, 093147741);





-- insert de terminales
insert into terminal (IdTerminal, NombreTerminal, IdPais) values(1, 'TC', 3);
insert into terminal (IdTerminal, NombreTerminal, IdPais) values(2, 'PE', 3);
insert into terminal (IdTerminal, NombreTerminal, IdPais) values(3, 'TPA', 2);
insert into terminal (IdTerminal, NombreTerminal, IdPais) values(4, 'CDC', 2);
insert into terminal (IdTerminal, NombreTerminal, IdPais) values(5, 'Pa', 2);
insert into terminal (IdTerminal, NombreTerminal, IdPais) values(6, 'Am', 6);
insert into terminal (IdTerminal, NombreTerminal, IdPais) values(7, 'Ber', 2);
insert into terminal (IdTerminal, NombreTerminal, IdPais) values(8, 'Mad', 2);
insert into terminal (IdTerminal, NombreTerminal, IdPais) values(9, 'Tok', 2);
insert into terminal (IdTerminal, NombreTerminal, IdPais) values(10, 'Bei', 2);
insert into terminal (IdTerminal, NombreTerminal, IdPais) values(11, 'BsAs', 1);
insert into terminal (IdTerminal, NombreTerminal, IdPais) values(12, 'Bog', 4);
insert into terminal (IdTerminal, NombreTerminal, IdPais) values(13, 'Qui', 5);



-- Inserte de buses
insert into bus (Idbus, Tipobus, Capacidadbus, Marcabus) values (1 , 'Electrico', 32, 'Mercedes Benz');
insert into bus (Idbus, Tipobus, Capacidadbus, Marcabus) values (2 , 'Hibrido', 16, 'Mercedes Benz');
insert into bus (Idbus, Tipobus, Capacidadbus, Marcabus) values (3 , 'Nafta', 20, 'Volvo');
insert into bus (Idbus, Tipobus, Capacidadbus, Marcabus) values (4 , 'Nafta', 40, 'Volkswagen');
insert into bus (Idbus, Tipobus, Capacidadbus, Marcabus) values (5 , 'Electrico', 38, 'Scania');
insert into bus (Idbus, Tipobus, Capacidadbus, Marcabus) values (6 , 'Nafta', 20, 'Volvo');
insert into bus (Idbus, Tipobus, Capacidadbus, Marcabus) values (7 , 'Hibrido', 40, 'Volkswagen');
insert into bus (Idbus, Tipobus, Capacidadbus, Marcabus) values (8 , 'Electrico', 40, 'Scania');



--Insert de asientos de buses
-- BUS 1
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 1, 'A');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 1, 'B');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 1, 'C');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 1, 'D');

insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 2, 'A');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 2, 'B');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 2, 'C');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 2, 'D');

insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 3, 'A');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 3, 'B');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 3, 'C');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 3, 'D');

insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 4, 'A');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 4, 'B');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 4, 'C');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 4, 'D');

insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 5, 'A');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 5, 'B');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 5, 'C');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 5, 'D');

insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 6, 'A');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 6, 'B');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 6, 'C');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 6, 'D');

insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 7, 'A');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 7, 'B');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 7, 'C');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 7, 'D');

insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 8, 'A');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 8, 'B');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 8, 'C');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (1, 8, 'D');


-- BUS 2

insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (2, 1, 'A');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (2, 1, 'B');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (2, 1, 'C');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (2, 1, 'D');

insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (2, 2, 'A');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (2, 2, 'B');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (2, 2, 'C');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (2, 2, 'D');

insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (2, 3, 'A');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (2, 3, 'B');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (2, 3, 'C');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (2, 3, 'D');

insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (2, 4, 'A');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (2, 4, 'B');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (2, 4, 'C');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (2, 4, 'D');




-- BUS 4

insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (3, 1, 'A');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (3, 1, 'B');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (3, 1, 'C');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (3, 1, 'D');

insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (3, 2, 'A');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (3, 2, 'B');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (3, 2, 'C');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (3, 2, 'D');

insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (3, 3, 'A');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (3, 3, 'B');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (3, 3, 'C');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (3, 3, 'D');

insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (3, 4, 'A');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (3, 4, 'B');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (3, 4, 'C');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (3, 4, 'D');

insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (3, 5, 'A');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (3, 5, 'B');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (3, 5, 'C');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (3, 5, 'D');


-- BUS 6

insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (6, 1, 'A');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (6, 1, 'B');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (6, 1, 'C');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (6, 1, 'D');

insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (6, 2, 'A');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (6, 2, 'B');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (6, 2, 'C');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (6, 2, 'D');

insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (6, 3, 'A');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (6, 3, 'B');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (6, 3, 'C');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (6, 3, 'D');

insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (6, 4, 'A');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (6, 4, 'B');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (6, 4, 'C');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (6, 4, 'D');

insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (6, 5, 'A');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (6, 5, 'B');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (6, 5, 'C');
insert into Asiento (Idbus, FilaAsiento, LetraAsiento) values (6, 5, 'D');




-- INFO DE PASAJES
insert into Viaje (IdTerminalOrigenViaje, IdTerminalDestinoViaje, FechaHoraViaje, Importe, Idbus, IdViaje) 
		   values (1                    , 3                     , '2021-9-19'  , 2000   , 6    , 250);
insert into Viaje (IdTerminalOrigenViaje, IdTerminalDestinoViaje, FechaHoraViaje, Importe, Idbus, IdViaje) 
		   values (3                    , 1                     , '2021-9-26'  , 2000   , 1    , 251);
insert into Viaje (IdTerminalOrigenViaje, IdTerminalDestinoViaje, FechaHoraViaje, Importe, Idbus, IdViaje) 
		   values (9                    , 10                     , '2021-12-23'  , 2000   , 2    , 252);
insert into Viaje (IdTerminalOrigenViaje, IdTerminalDestinoViaje, FechaHoraViaje, Importe, Idbus, IdViaje) 
		   values (12                    , 11                   , '2022-1-2'	, 1900   , 3    , 253);
insert into Viaje (IdTerminalOrigenViaje, IdTerminalDestinoViaje, FechaHoraViaje, Importe, Idbus, IdViaje) 
		   values (5                    , 8                     , '2022-12-23'  , 2000   , 2    , 254);

insert into Viaje (IdTerminalOrigenViaje, IdTerminalDestinoViaje, FechaHoraViaje, Importe, Idbus, IdViaje) 
		   values (13                   , 12                    , '2022-1-2'	, 2500   , 6    , 255);			-- PARA LA CONSULTA NRO 4.

insert into Viaje (IdTerminalOrigenViaje, IdTerminalDestinoViaje, FechaHoraViaje, Importe, Idbus, IdViaje) 
		   values (10                    , 9                     , '2023-1-2'  , 2300   , 3    , 256);
insert into Viaje (IdTerminalOrigenViaje, IdTerminalDestinoViaje, FechaHoraViaje, Importe, Idbus, IdViaje) 
		   values (11                    , 13                     , '2023-1-2'  , 3200   , 3    , 257);
insert into Viaje (IdTerminalOrigenViaje, IdTerminalDestinoViaje, FechaHoraViaje, Importe, Idbus, IdViaje) 
		   values (8                    , 6						, '2020-8-2'	, 2600   , 8    , 258);
insert into Viaje (IdTerminalOrigenViaje, IdTerminalDestinoViaje, FechaHoraViaje, Importe, Idbus, IdViaje) 
		   values (6                    , 7                     , '2021-11-10 12:39:45.770' , 2500   , 6    , 259);


insert into Boleto (IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, idViaje) values (2, 6, 4, 'C', '2022-1-2', 255);
insert into Boleto (IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, idViaje) values (3, 6, 4, 'D', '2021-12-26', 255);
insert into Boleto (IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, idViaje) values (4, 6, 1, 'A', '2021-12-28', 255);
insert into Boleto (IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, idViaje) values (5, 6, 2, 'B', '2021-12-30', 255);

-- 1er pasajero con 5 o mas pasajes comprados 

insert into Boleto (IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, idViaje) values (1, 6, 1, 'D', '2021-9-2', 250);
insert into Boleto (IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, idViaje) values (1, 1, 2, 'B', '2021-9-26', 251);
insert into Boleto (IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, idViaje) values (1, 2, 2, 'A', '2021-12-23', 252);
insert into Boleto (IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, idViaje) values (1, 3, 3, 'B', '2022-1-2', 253);
insert into Boleto (IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, idViaje) values (1, 2, 2, 'C', '2022-12-23', 254);
insert into Boleto (IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, idViaje) values (1, 3, 1, 'D', '2023-1-2', 256);
insert into Boleto (IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, idViaje) values (1, 3, 2, 'B', '2021-9-15', 257);

-- 2do pasajero con 5 o mas pasajes comprados 
insert into Boleto (IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, idViaje) values (12, 1, 2, 'A', '2021-9-21', 251);
insert into Boleto (IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, idViaje) values (12, 2, 2, 'B', '2021-9-26', 252);
insert into Boleto (IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, idViaje) values (12, 3, 3, 'B', '2022-1-1', 253);
insert into Boleto (IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, idViaje) values (12, 2, 2, 'C', '2022-12-20', 254);
insert into Boleto (IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, idViaje) values (12, 3, 1, 'D', '2022-12-2', 256);
insert into Boleto (IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, idViaje) values (12, 1, 2, 'B', '2020-7-25', 258);



insert into PasajeroMercoSur (Idpasajero, PorcentajePasajeroMercoSur) values (1,10)
insert into PasajeroMercoSur (Idpasajero, PorcentajePasajeroMercoSur) values (2,25)
insert into PasajeroMercoSur (Idpasajero, PorcentajePasajeroMercoSur) values (3,15)
insert into PasajeroMercoSur (Idpasajero, PorcentajePasajeroMercoSur) values (4,35)
insert into PasajeroMercoSur (Idpasajero, PorcentajePasajeroMercoSur) values (5,10)
insert into PasajeroMercoSur (Idpasajero, PorcentajePasajeroMercoSur) values (6,5)
insert into PasajeroMercoSur (Idpasajero, PorcentajePasajeroMercoSur) values (7,20)
insert into PasajeroMercoSur (Idpasajero, PorcentajePasajeroMercoSur) values (8,15)
insert into PasajeroMercoSur (Idpasajero, PorcentajePasajeroMercoSur) values (9,50)
insert into PasajeroMercoSur (Idpasajero, PorcentajePasajeroMercoSur) values (10,20)



insert into PasajeroMercoSurBeneficio (Idpasajero, BeneficioMercoSur) values (1, '1 Valija extra en bodega');
insert into PasajeroMercoSurBeneficio (Idpasajero, BeneficioMercoSur) values (2, 'Acceso a sala VIP en terminales');
insert into PasajeroMercoSurBeneficio (Idpasajero, BeneficioMercoSur) values (3, 'Elecci�n de asiento');
insert into PasajeroMercoSurBeneficio (Idpasajero, BeneficioMercoSur) values (4, 'Snacks de regalo');
insert into PasajeroMercoSurBeneficio (Idpasajero, BeneficioMercoSur) values (5, 'Acceso a sala VIP en terminales');
insert into PasajeroMercoSurBeneficio (Idpasajero, BeneficioMercoSur) values (6, 'Snacks de regalo');
insert into PasajeroMercoSurBeneficio (Idpasajero, BeneficioMercoSur) values (7, '1 Valija extra en bodega');
insert into PasajeroMercoSurBeneficio (Idpasajero, BeneficioMercoSur) values (8, 'Elecci�n de asiento');
insert into PasajeroMercoSurBeneficio (Idpasajero, BeneficioMercoSur) values (9, 'Snacks de regalo');
insert into PasajeroMercoSurBeneficio (Idpasajero, BeneficioMercoSur) values (10, 'Elecci�n de asiento');


-----------------------------------------------------------------------------
-- solucion de consultas del obligatorio
-----------------------------------------------------------------------------

-- 1. Listar el o los nombres de los pasajeros con la mayor cantidad de pasajes comprados a su nombre.

select Pasajero.IdPasajero, NombrePasajero, APaternoPasajero, AMaternoPasajero, count(*) cantPasajes from Boleto, Pasajero
where Boleto.IdPasajero=Pasajero.IdPasajero
group by Pasajero.IdPasajero, NombrePasajero, APaternoPasajero, AMaternoPasajero
having count(*) >= all (select count(*) from Boleto group by IdPasajero)




-- 2. Listar todos los datos de los buses con m�s de 35 asientos que no tengan asignado
--   ning�n destino que parta el d�a de ma�ana.

insert into Viaje	(IdTerminalOrigenViaje	,IdTerminalDestinoViaje	,FechaHoraViaje				,Importe,Idbus	,IdViaje) 
values				(1						,2						, DATEADD(day, 1, getdate()),150	,8		,260		)

delete from Viaje where IdViaje=260

-- COMPARAR RESULTADOS CON EL INSERT Y SIN EL INSERT DE LAS LINEAS 450-451. PARA BORRAR ESE VIAJE USAR DELETE DE LINEA 453. 
-- AL TERMINAR ESTA CONSULTA EJECUTAR EL DELETE DE LA LINEA 453 PARA EVITAR CONFUSIONES RESPECTO A LOS RESULTADOS OBTENIDOS MOSTRADOS MAS ABAJO EN LINEA 521

-- Listar todos los buses (capacidad > 35)
select * from bus
where Capacidadbus > 35 and Idbus in
(-- Listar los buses 
select Bus.Idbus from Viaje, Bus
group by Bus.Idbus
having Bus.Idbus not in(
select Bus.Idbus from Viaje, Bus
where Bus.Idbus=Viaje.Idbus and day(dateadd(dd, 1, getdate()))=day(FechaHoraViaje) and MONTH(getdate())=MONTH(FechaHoraViaje) and YEAR(GETDATE())=YEAR(FechaHoraViaje)))


-- AL TERMINAR ESTA CONSULTA EJECUTAR EL DELETE DE LA LINEA 453 PARA EVITAR CONFUSIONES RESPECTO A LOS RESULTADOS OBTENIDOS MOSTRADOS MAS ABAJO 
-- A PARTIR DE LA LINEA 521


-- 3. Listar todos los datos de los pasajeros para los cuales haya registrados en el sistema m�s
--    de 5 pasajes comprados.

select * from Pasajero
where IdPasajero in
(select IdPasajero from Boleto
group by IdPasajero
having count(*) > 5)




-- 4. Listar idpasajero, nombre, apellidos y asiento (idasiento y fila) que correspondan a pasajes
--    comprados para el destino cuyo idviaje es 255.

select Pasajero.IdPasajero, NombrePasajero, APaternoPasajero, AMaternoPasajero, FilaAsiento, LetraAsiento, IdViaje from Pasajero, Boleto
where Pasajero.IdPasajero=Boleto.IdPasajero and IdViaje=255


-- 5. Listar todos los iddestino y cantidad de pasajes comprados durante el mes de Setiembre
--    de este a�o para c/u de los destinos del pasajero cuyo correo es soyturista@gmail.com.
--    La lista debe estar ordenada por iddestino ascendente. 

select Viaje.IdViaje, IdTerminalDestinoViaje, count(*) cantPasajes, FechaCompraBoleto  from Viaje, Boleto, Pasajero
where Viaje.IdViaje=Boleto.IdViaje and Boleto.IdPasajero=Pasajero.IdPasajero and EmailPasajero='soyturista@gmail.com' and month(FechaCompraBoleto)=9 and year(FechaCompraBoleto)=year(getdate())
group by FechaCompraBoleto, IdTerminalDestinoViaje, Viaje.IdViaje
order by IdTerminalDestinoViaje asc