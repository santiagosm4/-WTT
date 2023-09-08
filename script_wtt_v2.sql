create database wtt;
use wtt;

CREATE TABLE tipo_documento (
  tdoc VARCHAR(10) NOT NULL PRIMARY KEY,
  desc_tdoc VARCHAR(30) NOT NULL,
  estado_tdoc BOOLEAN NOT NULL
);

CREATE TABLE persona (
  pk_fk_tdoc VARCHAR(10) NOT NULL,
  id_persona INT NOT NULL,
  nom_persona VARCHAR(25) NOT NULL,
  apellido_persona VARCHAR(25) NOT NULL,
  direccion_persona VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  estado TINYINT(1) NOT NULL,
  contraseña VARCHAR(45) NOT NULL,
  PRIMARY KEY (pk_fk_tdoc, id_persona)
);

CREATE TABLE persona_has_roles (
  persona_tdoc VARCHAR(10) NOT NULL,
  persona_id INT NOT NULL,
  persona_rol INT NOT NULL,
  estado_rol BOOLEAN NOT NULL,
  PRIMARY KEY (persona_tdoc, persona_id, persona_rol),
  FOREIGN KEY (persona_tdoc, persona_id) REFERENCES persona(pk_fk_tdoc, id_persona),
  FOREIGN KEY (persona_rol) REFERENCES roles(cod_rol)
);

CREATE TABLE roles (
  cod_rol INT NOT NULL PRIMARY KEY,
  desc_rol VARCHAR(30) NOT NULL
);

CREATE TABLE proveedor (
  tdoc_proveedor VARCHAR(10) NOT NULL,
  id_proveedor INT NOT NULL,
  telefono_sede BIGINT NOT NULL,
  PRIMARY KEY (tdoc_proveedor, id_proveedor),
  FOREIGN KEY (tdoc_proveedor, id_proveedor) REFERENCES persona(pk_fk_tdoc, id_persona)
);

CREATE TABLE empleado (
  tdoc_empleado VARCHAR(10) NOT NULL,
  id_empleado INT NOT NULL,
  sueldo_empleado DOUBLE NOT NULL,
  PRIMARY KEY (tdoc_empleado, id_empleado),
  FOREIGN KEY (tdoc_empleado, id_empleado) REFERENCES persona(pk_fk_tdoc, id_persona)
);

CREATE TABLE cliente (
  tdoc_cliente VARCHAR(10) NOT NULL,
  id_cliente INT NOT NULL,
  PRIMARY KEY (tdoc_cliente, id_cliente),
  FOREIGN KEY (tdoc_cliente, id_cliente) REFERENCES persona(pk_fk_tdoc, id_persona)
);

CREATE TABLE factura_compra_entrada (
  n_factura_comp INT NOT NULL PRIMARY KEY,
  empleado_tdoc VARCHAR(10) NOT NULL,
  fecha_entrada DATE NOT NULL,
  empleado_id INT NOT NULL,
  proveedor_tdoc VARCHAR(10) NOT NULL,
  proveedor_id INT NOT NULL,
  FOREIGN KEY (n_factura_comp) REFERENCES factura(n_factura),
  FOREIGN KEY (empleado_tdoc, empleado_id) REFERENCES empleado(tdoc_empleado, id_empleado),
  FOREIGN KEY (proveedor_tdoc, proveedor_id) REFERENCES proveedor(tdoc_proveedor, id_proveedor)
);

CREATE TABLE factura_venta (
  n_factura_vent INT NOT NULL PRIMARY KEY,
  cliente_tdoc VARCHAR(10) NOT NULL,
  cliente_id INT NOT NULL,
  empleado_tdoc_v VARCHAR(10) NOT NULL,
  empleado_id_v INT NOT NULL,
  FOREIGN KEY (n_factura_vent) REFERENCES factura(n_factura),
  FOREIGN KEY (cliente_tdoc, cliente_id) REFERENCES cliente(tdoc_cliente, id_cliente),
  FOREIGN KEY (empleado_tdoc_v, empleado_id_v) REFERENCES empleado(tdoc_empleado, id_empleado)
);

CREATE TABLE factura (
  n_factura INT NOT NULL PRIMARY KEY,
  fecha_factura DATE NOT NULL,
  subtotal DECIMAL(10, 2) NOT NULL,
  iva DECIMAL(10, 2) NOT NULL,
  total_factura DECIMAL(10, 2) NOT NULL
);

CREATE TABLE tipo_producto (
  tipo_prod VARCHAR(20) NOT NULL PRIMARY KEY,
  estado_tprod BOOLEAN NOT NULL
);

CREATE TABLE factura_productos (
  fk_pk_n_factura INT NOT NULL,
  fk_pk_cod_producto VARCHAR(10) NOT NULL,
  cantidad_prod INT NOT NULL,
  valor_prod_cant DOUBLE,
  PRIMARY KEY (fk_pk_n_factura, fk_pk_cod_producto),
  FOREIGN KEY (fk_pk_n_factura) REFERENCES factura(n_factura),
  FOREIGN KEY (fk_pk_cod_producto) REFERENCES productos(cod_producto)
);

CREATE TABLE productos (
  cod_producto VARCHAR(10) NOT NULL PRIMARY KEY,
  desc_producto VARCHAR(45) NOT NULL,
  Serial_prod VARCHAR(45) NOT NULL,
  valor_producto DOUBLE NOT NULL,
  fk_tipo_prod VARCHAR(20) NOT NULL,
  FOREIGN KEY (fk_tipo_prod) REFERENCES tipo_producto(tipo_prod)
);
CREATE TABLE tipo_documento (
  tdoc VARCHAR(10) NOT NULL PRIMARY KEY,
  desc_tdoc VARCHAR(30) NOT NULL,
  estado_tdoc BOOLEAN NOT NULL
);

CREATE TABLE persona (
  pk_fk_tdoc VARCHAR(10) NOT NULL,
  id_persona INT NOT NULL,
  nom_persona VARCHAR(25) NOT NULL,
  apellido_persona VARCHAR(25) NOT NULL,
  direccion_persona VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  estado TINYINT(1) NOT NULL,
  contraseña VARCHAR(45) NOT NULL,
  PRIMARY KEY (pk_fk_tdoc, id_persona)
);

CREATE TABLE persona_has_roles (
  persona_tdoc VARCHAR(10) NOT NULL,
  persona_id INT NOT NULL,
  persona_rol INT NOT NULL,
  estado_rol BOOLEAN NOT NULL,
  PRIMARY KEY (persona_tdoc, persona_id, persona_rol),
  FOREIGN KEY (persona_tdoc, persona_id) REFERENCES persona(pk_fk_tdoc, id_persona),
  FOREIGN KEY (persona_rol) REFERENCES roles(cod_rol)
);

CREATE TABLE roles (
  cod_rol INT NOT NULL PRIMARY KEY,
  desc_rol VARCHAR(30) NOT NULL
);

CREATE TABLE proveedor (
  tdoc_proveedor VARCHAR(10) NOT NULL,
  id_proveedor INT NOT NULL,
  telefono_sede BIGINT NOT NULL,
  PRIMARY KEY (tdoc_proveedor, id_proveedor),
  FOREIGN KEY (tdoc_proveedor, id_proveedor) REFERENCES persona(pk_fk_tdoc, id_persona)
);

CREATE TABLE empleado (
  tdoc_empleado VARCHAR(10) NOT NULL,
  id_empleado INT NOT NULL,
  sueldo_empleado DOUBLE NOT NULL,
  PRIMARY KEY (tdoc_empleado, id_empleado),
  FOREIGN KEY (tdoc_empleado, id_empleado) REFERENCES persona(pk_fk_tdoc, id_persona)
);

CREATE TABLE cliente (
  tdoc_cliente VARCHAR(10) NOT NULL,
  id_cliente INT NOT NULL,
  PRIMARY KEY (tdoc_cliente, id_cliente),
  FOREIGN KEY (tdoc_cliente, id_cliente) REFERENCES persona(pk_fk_tdoc, id_persona)
);

CREATE TABLE factura_compra_entrada (
  n_factura_comp INT NOT NULL PRIMARY KEY,
  empleado_tdoc VARCHAR(10) NOT NULL,
  fecha_entrada DATE NOT NULL,
  empleado_id INT NOT NULL,
  proveedor_tdoc VARCHAR(10) NOT NULL,
  proveedor_id INT NOT NULL,
  FOREIGN KEY (n_factura_comp) REFERENCES factura(n_factura),
  FOREIGN KEY (empleado_tdoc, empleado_id) REFERENCES empleado(tdoc_empleado, id_empleado),
  FOREIGN KEY (proveedor_tdoc, proveedor_id) REFERENCES proveedor(tdoc_proveedor, id_proveedor)
);

CREATE TABLE factura_venta (
  n_factura_vent INT NOT NULL PRIMARY KEY,
  cliente_tdoc VARCHAR(10) NOT NULL,
  cliente_id INT NOT NULL,
  empleado_tdoc_v VARCHAR(10) NOT NULL,
  empleado_id_v INT NOT NULL,
  FOREIGN KEY (n_factura_vent) REFERENCES factura(n_factura),
  FOREIGN KEY (cliente_tdoc, cliente_id) REFERENCES cliente(tdoc_cliente, id_cliente),
  FOREIGN KEY (empleado_tdoc_v, empleado_id_v) REFERENCES empleado(tdoc_empleado, id_empleado)
);

CREATE TABLE factura (
  n_factura INT NOT NULL PRIMARY KEY,
  fecha_factura DATE NOT NULL,
  subtotal DECIMAL(10, 2) NOT NULL,
  iva DECIMAL(10, 2) NOT NULL,
  total_factura DECIMAL(10, 2) NOT NULL
);

CREATE TABLE tipo_producto (
  tipo_prod VARCHAR(20) NOT NULL PRIMARY KEY,
  estado_tprod BOOLEAN NOT NULL
);

CREATE TABLE factura_productos (
  fk_pk_n_factura INT NOT NULL,
  fk_pk_cod_producto VARCHAR(10) NOT NULL,
  cantidad_prod INT NOT NULL,
  valor_prod_cant DOUBLE,
  PRIMARY KEY (fk_pk_n_factura, fk_pk_cod_producto),
  FOREIGN KEY (fk_pk_n_factura) REFERENCES factura(n_factura),
  FOREIGN KEY (fk_pk_cod_producto) REFERENCES productos(cod_producto)
);

CREATE TABLE productos (
  cod_producto VARCHAR(10) NOT NULL PRIMARY KEY,
  desc_producto VARCHAR(45) NOT NULL,
  Serial_prod VARCHAR(45) NOT NULL,
  valor_producto DOUBLE NOT NULL,
  fk_tipo_prod VARCHAR(20) NOT NULL,
  FOREIGN KEY (fk_tipo_prod) REFERENCES tipo_producto(tipo_prod)
);
CREATE TABLE tipo_documento (
  tdoc VARCHAR(10) NOT NULL PRIMARY KEY,
  desc_tdoc VARCHAR(30) NOT NULL,
  estado_tdoc BOOLEAN NOT NULL
);

CREATE TABLE persona (
  pk_fk_tdoc VARCHAR(10) NOT NULL,
  id_persona INT NOT NULL,
  nom_persona VARCHAR(25) NOT NULL,
  apellido_persona VARCHAR(25) NOT NULL,
  direccion_persona VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  estado TINYINT(1) NOT NULL,
  contraseña VARCHAR(45) NOT NULL,
  PRIMARY KEY (pk_fk_tdoc, id_persona)
);

CREATE TABLE persona_has_roles (
  persona_tdoc VARCHAR(10) NOT NULL,
  persona_id INT NOT NULL,
  persona_rol INT NOT NULL,
  estado_rol BOOLEAN NOT NULL,
  PRIMARY KEY (persona_tdoc, persona_id, persona_rol),
  FOREIGN KEY (persona_tdoc, persona_id) REFERENCES persona(pk_fk_tdoc, id_persona),
  FOREIGN KEY (persona_rol) REFERENCES roles(cod_rol)
);

CREATE TABLE roles (
  cod_rol INT NOT NULL PRIMARY KEY,
  desc_rol VARCHAR(30) NOT NULL
);

CREATE TABLE proveedor (
  tdoc_proveedor VARCHAR(10) NOT NULL,
  id_proveedor INT NOT NULL,
  telefono_sede BIGINT NOT NULL,
  PRIMARY KEY (tdoc_proveedor, id_proveedor),
  FOREIGN KEY (tdoc_proveedor, id_proveedor) REFERENCES persona(pk_fk_tdoc, id_persona)
);

CREATE TABLE empleado (
  tdoc_empleado VARCHAR(10) NOT NULL,
  id_empleado INT NOT NULL,
  sueldo_empleado DOUBLE NOT NULL,
  PRIMARY KEY (tdoc_empleado, id_empleado),
  FOREIGN KEY (tdoc_empleado, id_empleado) REFERENCES persona(pk_fk_tdoc, id_persona)
);

CREATE TABLE cliente (
  tdoc_cliente VARCHAR(10) NOT NULL,
  id_cliente INT NOT NULL,
  PRIMARY KEY (tdoc_cliente, id_cliente),
  FOREIGN KEY (tdoc_cliente, id_cliente) REFERENCES persona(pk_fk_tdoc, id_persona)
);

CREATE TABLE factura_compra_entrada (
  n_factura_comp INT NOT NULL PRIMARY KEY,
  empleado_tdoc VARCHAR(10) NOT NULL,
  fecha_entrada DATE NOT NULL,
  empleado_id INT NOT NULL,
  proveedor_tdoc VARCHAR(10) NOT NULL,
  proveedor_id INT NOT NULL,
  FOREIGN KEY (n_factura_comp) REFERENCES factura(n_factura),
  FOREIGN KEY (empleado_tdoc, empleado_id) REFERENCES empleado(tdoc_empleado, id_empleado),
  FOREIGN KEY (proveedor_tdoc, proveedor_id) REFERENCES proveedor(tdoc_proveedor, id_proveedor)
);

CREATE TABLE factura_venta (
  n_factura_vent INT NOT NULL PRIMARY KEY,
  cliente_tdoc VARCHAR(10) NOT NULL,
  cliente_id INT NOT NULL,
  empleado_tdoc_v VARCHAR(10) NOT NULL,
  empleado_id_v INT NOT NULL,
  FOREIGN KEY (n_factura_vent) REFERENCES factura(n_factura),
  FOREIGN KEY (cliente_tdoc, cliente_id) REFERENCES cliente(tdoc_cliente, id_cliente),
  FOREIGN KEY (empleado_tdoc_v, empleado_id_v) REFERENCES empleado(tdoc_empleado, id_empleado)
);

CREATE TABLE factura (
  n_factura INT NOT NULL PRIMARY KEY,
  fecha_factura DATE NOT NULL,
  subtotal DECIMAL(10, 2) NOT NULL,
  iva DECIMAL(10, 2) NOT NULL,
  total_factura DECIMAL(10, 2) NOT NULL
);

CREATE TABLE tipo_producto (
  tipo_prod VARCHAR(20) NOT NULL PRIMARY KEY,
  estado_tprod BOOLEAN NOT NULL
);

CREATE TABLE factura_productos (
  fk_pk_n_factura INT NOT NULL,
  fk_pk_cod_producto VARCHAR(10) NOT NULL,
  cantidad_prod INT NOT NULL,
  valor_prod_cant DOUBLE,
  PRIMARY KEY (fk_pk_n_factura, fk_pk_cod_producto),
  FOREIGN KEY (fk_pk_n_factura) REFERENCES factura(n_factura),
  FOREIGN KEY (fk_pk_cod_producto) REFERENCES productos(cod_producto)
);

CREATE TABLE productos (
  cod_producto VARCHAR(10) NOT NULL PRIMARY KEY,
  desc_producto VARCHAR(45) NOT NULL,
  Serial_prod VARCHAR(45) NOT NULL,
  valor_producto DOUBLE NOT NULL,
  fk_tipo_prod VARCHAR(20) NOT NULL,
  FOREIGN KEY (fk_tipo_prod) REFERENCES tipo_producto(tipo_prod)
);
CREATE TABLE tipo_documento (
  tdoc VARCHAR(10) NOT NULL PRIMARY KEY,
  desc_tdoc VARCHAR(30) NOT NULL,
  estado_tdoc BOOLEAN NOT NULL
);

CREATE TABLE persona (
  pk_fk_tdoc VARCHAR(10) NOT NULL,
  id_persona INT NOT NULL,
  nom_persona VARCHAR(25) NOT NULL,
  apellido_persona VARCHAR(25) NOT NULL,
  direccion_persona VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  estado TINYINT(1) NOT NULL,
  contraseña VARCHAR(45) NOT NULL,
  PRIMARY KEY (pk_fk_tdoc, id_persona)
);

CREATE TABLE persona_has_roles (
  persona_tdoc VARCHAR(10) NOT NULL,
  persona_id INT NOT NULL,
  persona_rol INT NOT NULL,
  estado_rol BOOLEAN NOT NULL,
  PRIMARY KEY (persona_tdoc, persona_id, persona_rol),
  FOREIGN KEY (persona_tdoc, persona_id) REFERENCES persona(pk_fk_tdoc, id_persona),
  FOREIGN KEY (persona_rol) REFERENCES roles(cod_rol)
);

CREATE TABLE roles (
  cod_rol INT NOT NULL PRIMARY KEY,
  desc_rol VARCHAR(30) NOT NULL
);

CREATE TABLE proveedor (
  tdoc_proveedor VARCHAR(10) NOT NULL,
  id_proveedor INT NOT NULL,
  telefono_sede BIGINT NOT NULL,
  PRIMARY KEY (tdoc_proveedor, id_proveedor),
  FOREIGN KEY (tdoc_proveedor, id_proveedor) REFERENCES persona(pk_fk_tdoc, id_persona)
);

CREATE TABLE empleado (
  tdoc_empleado VARCHAR(10) NOT NULL,
  id_empleado INT NOT NULL,
  sueldo_empleado DOUBLE NOT NULL,
  PRIMARY KEY (tdoc_empleado, id_empleado),
  FOREIGN KEY (tdoc_empleado, id_empleado) REFERENCES persona(pk_fk_tdoc, id_persona)
);

CREATE TABLE cliente (
  tdoc_cliente VARCHAR(10) NOT NULL,
  id_cliente INT NOT NULL,
  PRIMARY KEY (tdoc_cliente, id_cliente),
  FOREIGN KEY (tdoc_cliente, id_cliente) REFERENCES persona(pk_fk_tdoc, id_persona)
);

CREATE TABLE factura_compra_entrada (
  n_factura_comp INT NOT NULL PRIMARY KEY,
  empleado_tdoc VARCHAR(10) NOT NULL,
  fecha_entrada DATE NOT NULL,
  empleado_id INT NOT NULL,
  proveedor_tdoc VARCHAR(10) NOT NULL,
  proveedor_id INT NOT NULL,
  FOREIGN KEY (n_factura_comp) REFERENCES factura(n_factura),
  FOREIGN KEY (empleado_tdoc, empleado_id) REFERENCES empleado(tdoc_empleado, id_empleado),
  FOREIGN KEY (proveedor_tdoc, proveedor_id) REFERENCES proveedor(tdoc_proveedor, id_proveedor)
);

CREATE TABLE factura_venta (
  n_factura_vent INT NOT NULL PRIMARY KEY,
  cliente_tdoc VARCHAR(10) NOT NULL,
  cliente_id INT NOT NULL,
  empleado_tdoc_v VARCHAR(10) NOT NULL,
  empleado_id_v INT NOT NULL,
  FOREIGN KEY (n_factura_vent) REFERENCES factura(n_factura),
  FOREIGN KEY (cliente_tdoc, cliente_id) REFERENCES cliente(tdoc_cliente, id_cliente),
  FOREIGN KEY (empleado_tdoc_v, empleado_id_v) REFERENCES empleado(tdoc_empleado, id_empleado)
);

CREATE TABLE factura (
  n_factura INT NOT NULL PRIMARY KEY,
  fecha_factura DATE NOT NULL,
  subtotal DECIMAL(10, 2) NOT NULL,
  iva DECIMAL(10, 2) NOT NULL,
  total_factura DECIMAL(10, 2) NOT NULL
);

CREATE TABLE tipo_producto (
  tipo_prod VARCHAR(20) NOT NULL PRIMARY KEY,
  estado_tprod BOOLEAN NOT NULL
);

CREATE TABLE factura_productos (
  fk_pk_n_factura INT NOT NULL,
  fk_pk_cod_producto VARCHAR(10) NOT NULL,
  cantidad_prod INT NOT NULL,
  valor_prod_cant DOUBLE,
  PRIMARY KEY (fk_pk_n_factura, fk_pk_cod_producto),
  FOREIGN KEY (fk_pk_n_factura) REFERENCES factura(n_factura),
  FOREIGN KEY (fk_pk_cod_producto) REFERENCES productos(cod_producto)
);

CREATE TABLE productos (
  cod_producto VARCHAR(10) NOT NULL PRIMARY KEY,
  desc_producto VARCHAR(45) NOT NULL,
  Serial_prod VARCHAR(45) NOT NULL,
  valor_producto DOUBLE NOT NULL,
  fk_tipo_prod VARCHAR(20) NOT NULL,
  FOREIGN KEY (fk_tipo_prod) REFERENCES tipo_producto(tipo_pr));