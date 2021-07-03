DIR="/var/lib/mysql/wordpress/";
if ! [ "$(ls -A $DIR)" ]; th
    mysql_install_db
    service mysql start
    mysql -u root -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}'"
    mysql -u root -e "CREATE DATABASE ${WP_DATABASE_NAME};use ${WP_DATABASE_NAME}"
    mysql -u root -e "use ${WP_DATABASE_NAME};GRANT ALL PRIVILEGES ON * TO '${MYSQL_USER}'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"
    mysql -u root wordpress < wp.sql
    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PW}';"
  
fi

mysqld_safe
