FROM debian:bullseye-slim
RUN apt update -y && apt upgrade -y
RUN apt install mariadb-server -y
RUN mkdir -p /run/mysqld/
RUN chown -R mysql:root /var/lib/mysql/ /run/mysqld/
#RUN apt install -y vim
#RUN apt install -y systemctl
#RUN echo "set nu\nset mouse=a" >> ~/.vimrc
#COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
#COPY init.sql /etc/mysql/init.sql
COPY set-init.sh .
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
EXPOSE 3306
ENTRYPOINT [ "bash", "set-init.sh" ]
#CMD ["mysqld"]