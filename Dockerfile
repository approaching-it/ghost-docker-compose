version: '3'
services:

  ghost:
    image: ghost:alpine
    restart: unless-stopped
    depends_on:
      - db
    ports:
      - 127.0.0.1:49429:2368
    environment:
      url: https://approaching.it
      database__client: mysql
      database__connection__host: db
      database__connection__user: root
      database__connection__password: ${DB_PASSWORD}
      database__connection__database: ghost
    volumes:
      - /opt/ghost/content:/var/lib/ghost/content

  db:
    image: mariadb:10.4
    restart: unless-stopped
    environment:
      MYSQL_ROOT_PASSWORD: ${DB_PASSWORD}
    volumes:
      - /opt/ghost/database:/var/lib/mysql
