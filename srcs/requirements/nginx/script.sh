
echo "server {
	listen 443 ssl;
	listen [::]:443 ssl;
	server_name         default_server;
	ssl_certificate     /etc/ssl/certs/selfsigned.crt;
	ssl_certificate_key /etc/ssl/private/selfsigned.key;
	ssl_protocols       TLSv1.3;
	root /var/www/html;
	# Add index.php to the list if you are using PHP
	index index.html index.htm index.nginx-debian.html;

	server_name _;
	location / {
		# First attempt to serve request as file, then
		# as directory, then fall back to displaying a 404.
		try_files  / =404;
	}
}" >> /etc/nginx/sites-available/default
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/selfsigned.key     -out /etc/ssl/certs/selfsigned.crt -subj "/C=SU/L=VAUD/O=667/OU=dev/CN=localhost"
