#!/bin/bash

# Näitame, kas PHP on juba installitud. 0 = ei ole installitud, 1 = installitud

PHP=$(dpkg-query -W -f='${Status}' php8.2 2>/dev/null | grep -c 'ok installed')

if [ $PHP -eq 0 ]; then
	echo "PHP ei ole installitud, paigaldame PHP ja lisad"
	apt install -y php8.2 libapache2-mod-php8.2 php8.2-mysql
	echo "PHP koos vajalike lisadega sai paigaldatud"

elif [ $PHP -eq 1 ]; then
	echo "PHP koos vajalike lisadega on juba paigaldatud"
	which php

fi

# Vaatame kas PHP töötab

if systemctl is-active --quiet php-fpm; then
	echo "PHP töötab"
else
	echo "PHP ei tööta"
fi
