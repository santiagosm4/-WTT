create database bd_wtt;
use bd_wtt;

create table tipo_documento(
    tip_doc varchar(15) not null,
    desc_tdoc varchar(30) not null,
    estado_tdoc boolean not null,
    primary key (tip_doc)
);

create table usuarios (
    id_us int not null,
    nom1_us varchar(30) not null,
    nom2_us varchar(30),
    ape1_us varchar(30) not null,
    ape2_us varchar(30),
    tel_us bigint not null,
    correo_us varchar(60) not null,
    estado_us boolean not null,
    pk_fk_tdoc varchar(15) not null,
    primary key (id_us,pk_fk_tdoc)
);

alter table usuarios
    add foreign key (pk_fk_tdoc)
    references tipo_documento(tip_doc);

create table proveedor(
    tdoc_prov varchar(15) not null,
    id_prov int not null,
    nom_prod varchar(45) not null,
    primary key (tdoc_prov,id_prov)
);

alter table proveedor
    add foreign key (tdoc_prov,id_prov)
    references usuarios (pk_fk_tdoc,id_us);

create table admin(
    tdoc_admin varchar(15) not null,
    id_admin int not null,
    primary key (tdoc_admin,id_admin)
);

alter table admin
add foreign key (tdoc_admin,id_admin)
references usuarios(pk_fk_tdoc,id_us);

create table trabajador(
    tdoc_trab varchar(15) not null,
    id_trab int not null,
    primary key (tdoc_trab,id_trab)
);

alter table trabajador
add foreign key (tdoc_trab,id_trab)
references usuarios(pk_fk_tdoc,id_us);

create table gerente(
    tdoc_geren varchar(15) not null,
    id_geren int not null,
    primary key (tdoc_geren,id_geren)
);

alter table gerente 
add foreign key (tdoc_geren,id_geren)
references usuarios(pk_fk_tdoc,id_us);

create table usuarios_has_roles(
    us_tdoc varchar(15) not null,
    us_id int not null,
    us_rol int not null,
    estado_rol boolean not null,
    primary key (us_tdoc,us_id,us_rol)
);

alter table usuarios_has_roles
add foreign key (us_tdoc,us_id,us_rol)
references usuarios(pk_fk_tdoc,id_us);

create table roles(
    cod_rol int not null,
    desc_rol varchar(40),
    primary key (cod_rol)
);

alter table usuarios_has_roles
add foreign key (us_rol)
references roles(cod_rol);

create table factura_compra(
    num_fact_comp int not null,
    trab_tdoc varchar(15) not null,
    trab_id int not null,
    prov_tdoc varchar(15) not null,
    prov_id int not null,
    primary key (num_fact_comp)
);

alter table factura_compra
add foreign key (trab_tdoc,trab_id)
references admin(tdoc_admin,id_admin);

alter table factura_compra
add foreign key (prov_tdoc,prov_id)
references proveedor(tdoc_prov,id_prov);

create table tienda(
    id_tienda varchar(10) not null,
    ciud_tienda varchar(40) not null,
    dir_tienda varchar(100) not null,
    estado_tienda boolean not null,
    tel_tienda bigint not null,
    primary key (id_tienda)
);

create table factura_alquiler(
    num_fact_alquil int not null,
    tienda_id varchar(10) not null,
    trab_fac_tdoc varchar(15)  not null,
    trab_fac_id int not null,
    primary key (num_fact_alquil)
);

alter table factura_alquiler
add foreign key (trab_fac_tdoc,trab_fac_id)
references trabajador(tdoc_trab,id_trab);

alter table factura_alquiler
add foreign key (tienda_id)
references tienda(id_tienda);

create table factura(
    num_fact int not null,
    fecha_fact date not null,
    subtotal double not null,
    iva double not null,
    total_fact double not null,
    primary key (num_fact)
);

alter table factura_compra
add  foreign key (num_fact_comp)
references factura(num_fact);

alter table factura_alquiler
add foreign key (num_fact_alquil)
references factura(num_fact);

create table factura_equipos(
    fk_pk_num_fact int not null,
    fk_pk_cod_equip varchar(10) not null,
    cantidad_equip int not null,
    valor_prod_cant double,
    primary key (fk_pk_num_fact,fk_pk_cod_equip)
);

alter table factura_equipos
add foreign key (fk_pk_num_fact)
references factura(num_fact);

create table equipos(
    cod_equip varchar(10) not null,
    nom_equip varchar(60) not null,
    valor_equip double not null,
    num_serie int not null,
    marca_equip varchar(60) not null,
    modelo_equip varchar(30) not null,
    fk_tipo_equip varchar(20) not null,
    primary key (cod_equip)
);

alter table factura_equipos
add foreign key (fk_pk_cod_equip)
references equipos(cod_equip);

create table tipo_equipo(
    id_tipo_equip varchar(10) not null,
    desc_tipo_equip varchar(20) not null,
    estado_equip boolean,
    primary key (id_tipo_equip)
);

alter table equipos
add foreign key (fk_tipo_equip)
references tipo_equipo(id_tipo_equip);