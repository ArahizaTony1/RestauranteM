use restauranteM;

drop PROCEDURE if exists  seguridad;
CREATE PROCEDURE seguridad (IN u VARCHAR(45),IN con VARCHAR(45))
BEGIN
SELECT * from usuarioAdministrador where correo=u && contrasena=con limit 1;
END;

call seguridad('jose.araiza@upam.edu.mx','1234');

CREATE PROCEDURE seguridadCliente (IN u VARCHAR(45),IN con VARCHAR(45))
BEGIN
SELECT * from cliente where correo=u && contrasena=con limit 1;
END;
SELECT * from cliente;

call seguridadCliente('jose.araiza@upam.edu.mx','1234');