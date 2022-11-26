# Описание сущностей (таблиц)
## Users (Пользователи)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| fullname | VARCHAR(50) | not null | ФИО пользователя |
| phone | VARCHAR(50) | not null | номер телефона пользователя |
| email | VARCHAR(50) | not null | почта пользователя |
| password | VARCHAR(255) | not null | пароль пользователя |
| role_id | fk(INT) | not null | роль |
| status | VARCHAR(100) | not null | статус пользователя |


## Roles (Роли пользователей)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| name | VARCHAR(50) | not null | название роли |


## User_Logs (Логи пользователей)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| user_id | fk(INT) | not null | пользователь |
| message | VARCHAR(300) | not tull | сообщение |


## Vehicles (Транспортные средства)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| user_id | fk(INT) | not null | пользователь |
| brand | VARCHAR(50) | not null | марка транспортного средства |
| vehicle_number | VARCHAR(50) | not null | номер транспортного средства |
| vehicle_type_id | fk(INT) | not null | тип транспортного средства |


## Vehicles_Type (Типы транспортного средства)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| name | VARCHAR(50) | not null | название типа транспортного средства |


## Vehicles & Services (Транспортные средства и обслуживания)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| vehicle_id | fk(INT) | not null | транспортное средство |
| service_id | fk(INT) | not null | обслуживание |


## Services (Обслуживания)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| service_description_id | fk(INT) | not null | описание обслуживания |
| name | VARCHAR(300) | not null | название обслуживания |
| service_type_id | fk(INT) | not null | тип обслуживания |


## Services_Type (Типы обслуживания)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| name | VARCHAR(50) | not null | название типа обслуживания |


## Service_Description (Описание обслуживания)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| start | date | not null | дата начала обслуживания |
| end | date | not null | дата завершения обслуживания |
| status | VARCHAR(100) | not null | статус обслуживания |
| comment | VARCHAR(300) | not tull | комментарий к обслуживанию |
| price | DECIMAL | not null | цена обслуживания |


## Orders (Заказы)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| user_id | fk(INT) | not null; unique | пользователь |
| number | VARCHAR(10) | not null | номер заказа |
| price | DECIMAL | not null | сумма заказа |


## Orders & Services (Заказы и обслуживания)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk(INT) | auto increment; not null; unique | первичный ключ |
| orders_id | fk(INT) | not null; unique | заказ |
| service_id | fk(INT) | not null; unique | обслуживание |


Связи многие ко многим для которых были созданы промежуточные таблицы:

 1. У транспортного средства может быть много обслуживаний, у обслуживания может быть несколько транспортных средств.  
 2. В заказе может быть несколько обслуживаний, обслуживания могут быть в разных заказах.
