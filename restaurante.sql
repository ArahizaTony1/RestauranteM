drop database if exists restauranteM;
create database if not exists restauranteM;
use restauranteM;

drop table if exists restaurante;
create table if not exists restaurante(
IDrestaurante int not null auto_increment,
Nombre varchar(45) not null,
Nmesas int ,
direccion varchar(45),
primary key(IDrestaurante)
);

drop table if exists Reserva;
create table if not exists Reserva(
IDreserva int not null auto_increment,
TipoReserva varchar(2)not null,
Direccion varchar(45)not null,
fecha date  not null ,
IDrestaurante int not null,    
primary key(IDreserva),
FOREIGN KEY (IDrestaurante) REFERENCES restaurante(IDrestaurante)
);
drop table if exists cliente;
create table if not exists cliente(
IDcliente int not null auto_increment,
nombre varchar(45),
correo varchar(50) not null unique,
contrasena varchar(50)not null ,
primary key(IDcliente)
);
drop table if exists clienteReserva;
CREATE table if not exists clienteReserva(
IDreserva int not null,
IDcliente int not null,
FOREIGN KEY (IDreserva) REFERENCES Reserva(IDreserva),
FOREIGN KEY (IDcliente) REFERENCES cliente(IDcliente),
primary key(IDcliente,IDreserva)
);
drop table if exists pago;
create table if not exists pago(
IDpago int not null auto_increment,
IDcliente int not null,
notaImprimir int not null,
primary key(IDpago),
FOREIGN KEY (IDcliente) REFERENCES cliente(IDcliente)
);
drop table if exists comanda;
create table if not exists comanda(
IDcomanda int not null auto_increment,
nombreP varchar(45) not null,
reseta text,
primary key(IDcomanda)
);

drop table if exists camarero;
create table if not exists camarero(
IDcamarero int not null auto_increment,
nombre varchar(45)not null,
NoDispositivo int not null,
NoCarta int not null,
primary key(IDcamarero)
);

drop TABLE if exists pedido;
CREATE table if not exists pedido(
IDpedido int not null auto_increment,
No_comida int not null,
nombre varchar(45)not null,
hora date,
IDcliente int not null,
IDcomanda int not null,
IDcamarero int not null,
primary key(IDpedido), 
FOREIGN KEY (IDcliente) REFERENCES cliente(IDcliente),
FOREIGN KEY (IDcomanda) REFERENCES comanda(IDcomanda),
FOREIGN KEY (IDcamarero) REFERENCES camarero(IDcamarero)
);

drop table if exists IDalmacen ;
create table if not exists almacen(
IDalmacen int not null auto_increment,
n_ingredientes varchar(45)not null,
NombreIngrediente varchar(45),
primary key(IDalmacen)
);

drop table if exists jefeC;
create table if not exists jefeC(
IDcocina int not null auto_increment,
IDalmacen int not null,
NO_platos int not null,
mensaje varchar(45),
primary key(IDcocina),
FOREIGN KEY (IDalmacen) REFERENCES almacen(IDalmacen)
);

drop table if exists pedidoAlmacen;
create table if not exists pedidoAlmacen(
IDpedido int not null,
IDalmacen int not null,
FOREIGN KEY (IDpedido) REFERENCES pedido(IDpedido),
FOREIGN KEY (IDalmacen) REFERENCES almacen(IDalmacen),
primary key(IDpedido,IDalmacen)
);

drop table if exists usuarioAdministrador;
create table if not exists usuarioAdministrador(
IDusuario int not null auto_increment,
nombre varchar(45)not null,
apellidop varchar(45)not null,
apellidom varchar(45)not null,
correo varchar(45)not null unique,
contrasena varchar(45)not null ,
primary key(IDusuario)
);


insert into usuarioAdministrador(nombre,apellidop,apellidom,correo,contrasena)
values('Jose','Garcia ','Araiza','jose.araiza@upam.edu.mx','1234'),('x','x','x','x','x');

insert into restaurante(Nombre,Nmesas,direccion)
values('x','x','x',);

drop PROCEDURE if exists  seguridad;
CREATE PROCEDURE seguridad (IN u VARCHAR(45),IN con VARCHAR(45))
BEGIN
SELECT * from usuarioAdministrador where correo=u && contrasena=con limit 1;
END;

CREATE PROCEDURE seguridadCliente (IN u VARCHAR(45),IN con VARCHAR(45))
BEGIN
SELECT * from cliente where correo=u && contrasena=con limit 1;
END;

call seguridad('jose.araiza@upam.edu.mx','1234');
use restauranteM;

insert into restaurante(Nombre,Nmesas,direccion)
values('x',2,'x');
insert into Reserva(TipoReserva,Direccion,fecha,IDrestaurante)
values('x','x','2018-02-28',1);
SELECT * from Reserva;


-- 4F4F4F
-- F56016

