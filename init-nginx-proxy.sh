#/bin/bash
echo
if [ -z "$1" ] || [ "$1" = "" ]
then
	echo "Undefined proxy domain name. Give domain name as parameter, for ex.: ./init-nginx-proxy.sh domain-name.com
	exit 1
fi

echo "Initializing nginx proxy for Guacamole using $1 as domain name"
sudo cp nginx/mysite.template /etc/nginx/conf.d/guacamole-proxy.conf
sudo sed -i "s|domain-name-here.com|$1|g" /etc/nginx/conf.d/guacamole-proxy.conf
echo
echo "Done: nginx proxy for Guacamole initialized. You'll want to create and deploy certificates (with certbot or similar) and restart nginx"
