### CRIAR USUARIO
GRANT ALL ON db_romulo.* TO "romulo"@"localhost" IDENTIFIED BY "123";

GRANT ALL ON db_romulo.* TO "romulo"@"localhost" IDENTIFIED BY "123";


CREATE USER 'romulo'@'localhost' IDENTIFIED WITH caching_sha2_password BY '***';

GRANT ALL PRIVILEGES ON *.* TO 'romulo'@'localhost' WITH GRANT OPTION;
ALTER USER 'romulo'@'localhost' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;
GRANT ALL PRIVILEGES ON `db_romulo`.* TO 'romulo'@'localhost';
