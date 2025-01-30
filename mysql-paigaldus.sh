#!/bin/bash

MYSQL=$(dpkg-query -W -f='${Status}' mysql-server 2>/dev/null | grep -c 'ok installed')

# juhul kui väärtus = 0

if [ $MYSQL -eq 0 ]; then

	echo "MYSQL ei ole paigaldatud"
	echo "Paigaldame MYSQL"
	apt install mysql-server
	echo "MYSQL paigaldatud"

	# lisame võimaluse kasutada MYSQL ilma kasutaja ja paroolita
	
	touch $HOME/.my.cnf
	echo "[client]" >> $HOME/.my.cnf
	echo "host = localhost" >> $HOME/.my.cnf
	echo "user = root" >> $HOME/.my.cnf
	echo "password = qwerty" >> $HOME/.my.cnf

# juhul, kui väärtus võrdub 1-ga

elif [ $MYSQL -eq 1 ]; then
	echo "MYSQL on juba paigaldatud!"

# lõpetame
fi
