-- Tipos de identificación
INSERT INTO id_type (name) VALUES ('CC'), ('TI'), ('CE'), ('PASAPORTE');

-- Marcas
INSERT INTO brand (name) VALUES
 ('Americanino'),
 ('American Eagle'),
 ('Chevignon'),
 ('Esprit'),
 ('Naf Naf'),
 ('Rifle');

-- País
INSERT INTO country (name) VALUES ('Colombia');

-- Departamentos
INSERT INTO department (name, country_id)
SELECT 'Antioquia', c.id FROM country c WHERE c.name = 'Colombia';
INSERT INTO department (name, country_id)
SELECT 'Cundinamarca', c.id FROM country c WHERE c.name = 'Colombia';

-- Ciudades
INSERT INTO city (name, department_id)
SELECT 'Medellín', d.id FROM department d WHERE d.name = 'Antioquia';
INSERT INTO city (name, department_id)
SELECT 'Envigado', d.id FROM department d WHERE d.name = 'Antioquia';
INSERT INTO city (name, department_id)
SELECT 'Bogotá', d.id FROM department d WHERE d.name = 'Cundinamarca';
INSERT INTO city (name, department_id)
SELECT 'Chía', d.id FROM department d WHERE d.name = 'Cundinamarca';
