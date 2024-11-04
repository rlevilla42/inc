FROM debian:bullseye-slim
RUN apt update -y && apt upgrade -y && apt install -y nginx
RUN apt install -y openssl
#RUN apt install -y systemctl && apt install -y lsof && apt install -y vim
#RUN echo "set nu\nset mouse=a" >> ~/.vimrc
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/selfsigned.key     -out /etc/ssl/certs/selfsigned.crt -subj "/C=SU/L=VAUD/O=667/OU=dev/CN=localhost"
COPY nginx.conf /etc/nginx/nginx.conf
#COPY script.sh .
#RUN bash script.sh
#CMD ["bash", "script.sh"]
CMD ["nginx", "-g", "daemon off;"]