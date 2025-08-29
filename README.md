# Formulario de Fidelidad (Spring Boot + MySQL + HTML/JS)

Formulario de inscripción al programa de fidelidad de marcas de GCO (Americanino, American Eagle, Chevignon, Esprit, Naf Naf, Rifle).  

## Tecnologías
- Java 17+ / Spring Boot 3
- Spring Web / Spring Data JPA / MySQL Driver
- MySQL 8.x
- Frontend: HTML + CSS + JS (SweetAlert2).

## Estructura
src/main/java/com/ejemplo/fidelidad/
├─ model/ # Entidades: IdType, Brand, Country, Department, City, Customer
├─ repository/ # JPA Repositories
├─ dto/ # CustomerRequest
└─ controller/ # ListController (GET), CustomerController (POST)
src/main/resources/
├─ application.properties
├─ data.sql # (opcional) datos iniciales de listas
└─ static/
├─ index.html # Formulario
├─ style.css # Estilos (fondo animado y marca seleccionada)
├─ script.js # Lógica: carga listas, POST, SweetAlert
└─ assets/ # Logos y fondos por marca
dump_fidelidad.sql # Dump de la base


## Preparar la base de datos

1) Crear DB/usuario (si no existen):

CREATE DATABASE IF NOT EXISTS fidelidad CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE USER IF NOT EXISTS 'fidelidad_user'@'localhost' IDENTIFIED BY 'clave123';
GRANT ALL PRIVILEGES ON fidelidad.* TO 'fidelidad_user'@'localhost';
FLUSH PRIVILEGES;

2)Importar el dump:

# Si el dump incluye --databases fidelidad
mysql -u fidelidad_user -p < dump_fidelidad.sql

# Si el dump es solo el esquema fidelidad
mysql -u fidelidad_user -p fidelidad < dump_fidelidad.sql

## Configuración de la app
src/main/resources/application.properties


spring.datasource.url=jdbc:mysql://127.0.0.1:3306/fidelidad?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true
spring.datasource.username=fidelidad_user
spring.datasource.password=clave123

spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true
spring.jpa.database-platform=org.hibernate.dialect.MySQL8Dialect
spring.jpa.defer-datasource-initialization=true

spring.jackson.date-format=yyyy-MM-dd
spring.jackson.time-zone=UTC
