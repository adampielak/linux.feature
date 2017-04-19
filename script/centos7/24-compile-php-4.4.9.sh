# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

# Warning: Install the databases before you compile
# Warning: No options '--enable-dom' '--with-dom-xslt' '--with-dom-exslt' '--with-openssl'

sh 06-install-devel.sh

yum install libxslt-devel postgresql-devel mysql-devel  mhash-devel freetype-devel libpng-devel libmcrypt-devel
yum install libcurl-devel xorg-x11-proto-devel libX11-devel cyrus-sasl-devel libjpeg-devel openldap-devel
yum install db4-devel expat-devel libidn-devel libXpm-devel httpd-devel gmp-devel ncurses-devel

cd /tmp
wget http://museum.php.net/php4/php-4.4.9.tar.gz
tar -xvzf ./php-4.4.9.tar.gz
wget https://download.suhosin.org/suhosin-patch-4.4.9-0.9.6.patch.gz
wget https://raw.githubusercontent.com/faew/linux.feature/master/patch/php5-gmp.patch
gunzip suhosin-patch-4.4.9-0.9.6.patch.gz
patch -p0 < ./suhosin-patch-4.4.9-0.9.6.patch
cd php-4.4.9
patch -p0 < ../php5-gmp.patch
sed -i "s/\$i\/lib\/lib/\$i\/lib64\/lib/g" configure
'./configure' '--prefix=/usr/local/php44' '--disable-debug' '--with-pic' '--disable-rpath' '--with-bz2' '--with-curl' '--enable-gd-native-ttf' '--without-gdbm' '--with-gettext' '--with-gmp' '--with-iconv' '--with-png' '--with-zlib' '--enable-exif' '--enable-ftp' '--enable-magic-quotes' '--enable-sockets' '--enable-sysvsem' '--enable-sysvshm' '--enable-sysvmsg' '--enable-track-vars' '--enable-trans-sid' '--enable-yp' '-enable-wddx' '--with-kerberos' '--enable-ucd-snmp-hack' '--enable-memory-limit' '--enable-shmop' '--enable-calendar' '--enable-dbx' '--enable-dio' '--with-xml' '--with-system-tzdata' '--enable-pcntl' '--enable-mbstring' '--enable-mbstr-enc-trans' '--enable-mbregex' '--with-ncurses' '--with-gd' '--enable-bcmath' '--enable-dba' '--with-xmlrpc' '--with-mysql' '--enable-soap' '--with-xsl' '--enable-xmlreader' '--enable-xmlwriter' '--enable-fastcgi' '--enable-pdo' '--with-pdo-mysql' '--with-pdo-sqlite' '--enable-dbase' '--with-mcrypt' '--with-json' '--with-pgsql' 
make
make install
cp ./php.ini-dist /usr/local/php44/lib/php.ini
/usr/local/php44/bin/php -v
