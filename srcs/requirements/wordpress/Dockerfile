FROM debian:bullseye-slim
RUN apt update -y && apt upgrade -y && apt install php-fpm -y
RUN apt install -y php-mysql
RUN apt install -y mariadb-client && apt install -y curl
RUN echo "set nu\nset mouse=a" >> ~/.vimrc
RUN mkdir -p /run/php
COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY wp-config.sh .
EXPOSE 9000
CMD ["bash", "wp-config.sh"]