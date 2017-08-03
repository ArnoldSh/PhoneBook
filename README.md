# PhoneBook
## About
Example of REST API web-service based on bundle Spring Boot + Spring JPA + Hibernate + Gradle + MySQL.

## How to Start
1. Firstly MySQL database initialization is needed. Run init script - (**src/db/init_db.sql**):
```sql
CREATE SCHEMA `pb` ;

CREATE TABLE `pb`.`person` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `pb`.`phone` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `person_id` INT NULL,
  `phone` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `PERSON_FK_idx` (`person_id` ASC),
  CONSTRAINT `PERSON_FK`
    FOREIGN KEY (`person_id`)
    REFERENCES `pb`.`person` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
```
2. After check application.properties (**src/main/java/resources/application.properties**) - default it is look like that:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/pb
spring.datasource.username=root
spring.datasource.password=root
spring.datasource.driver-class-name=com.mysql.jdbc.Driver
 
hibernate.hbm2ddl.auto=update
 
hibernate.dialect=org.hibernate.dialect.MySQLDialect

hibernate.show_sql=true
 
logging.level.org.hibernate.SQL=TRACE
logging.level.org.hibernate.type.descriptor.sql.BasicBinder=TRACE
```
3. Now you can start Spring Boot-based application by following command (from app root):
```batch
gradle bootRun
```
For stopping embedded Tomcat use next command:
```batch
gradle -stop
```

4. Try to execute test command (use browser or curl):
```batch
curl localhost:8080/api/add?name=newUserName
```
REST API of PhoneBook is supports following commands:
```
- /api/get?id=<PERSON_ID> (GET)
- /api/add?name=<NAME>[&phone=<PHONE>] (GET)
- /api/edit?id=<PERSON_ID>[&name=<NEW_NAME>&phone=<NEW_PHONE>] (GET)
- /api/delete?id=<PERSON_ID> (GET)
```

All API methods are implemented by GET method for simplification. 
Request parameters **id** and **name** are always mandatory.
The parameters in **[ ]** are not mandatory and could be ignored.
## Requirements
MySQL 5.6, Gradle 4.0, Java 1.7.