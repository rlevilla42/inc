FROM debian:bullseye-slim
RUN apt update -y && apt upgrade -y
RUN apt install mariadb-server -y
RUN mkdir -p /run/mysqld/
RUN chown -R mysql:root /var/lib/mysql/ /run/mysqld/

#help for debug if necessary

#RUN apt install -y vim
#RUN apt install -y systemctl
#RUN echo "set nu\nset mouse=a" >> ~/.vimrc

COPY set-init.sh .
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
EXPOSE 3306
#ENTRYPOINT [ "bash", "set-init.sh" ] #execute the script with ENTRYPOINT or CMD as i can see it changes nothing
CMD [ "bash", "set-init.sh" ]
#CMD ["mysqld"] finally i've had mysqld at the end of the script, like this mysqld will be execute during the construction of the image, not at the lunch of the docker