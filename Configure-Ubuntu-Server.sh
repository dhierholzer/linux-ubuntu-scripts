#!/bin/bash
#Become master of the everything within this host
[ `whoami` = root ] || exec sudo $0
	#Update and Upgrade
	echo "Updating and Upgrading"
	apt-get update && sudo apt-get upgrade -y
	sudo apt-get install dialog
	cmd=(dialog --separate-output --checklist "Please Select Software you want to install:" 22 76 16)
	options=(1 "All PHP Packages" off    # any option can be set to default to "on"
	         2 "Apache2" off
	         3 "Build Essentials" off
	         4 "Rust" off
	         5 "Git" off
	         6 "Composer" off
	         7 "JRE && JDK" off
	         8 "MySQL" off
	         9 "Nginx" off
	         10 "Install Redis" off
	         11 "Unity Tewak Tool" off
	         12 "Install cURL & ZIP/UNZIP" off
	         13 "Lets Encrypt" off
	         14 "Laravel" off
	         15 "Install Ruby" off
	         16 "Python (all versions)" off
	         17 "Node.js, NVM, & NPM" off
	         18 "Numix Icons" off)
	choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
	clear
	for choice in $choices
	do
	    case $choice in
	        1)
	            #Install All PHP Versions 7.0 - 8.2 including libapache2-mod-phpX.X package
                echo "Installing All PHP Versions"
                echo "Install Some PPAs for PHP"
                apt-add-repository ppa:ondrej/php -y
                apt-add-repository ppa:chris-lea/redis-server -y
                echo "Install Generic PHP packages"
                apt-get install -y --allow-change-held-packages \
                php-imagick php-memcached php-redis php-xdebug php-dev php-swoole imagemagick mcrypt
                echo "PHP 7.0"
                apt-get install -y --allow-change-held-packages \
                php7.0-bcmath php7.0-bz2 php7.0-cgi php7.0-cli php7.0-common php7.0-curl php7.0-dba php7.0-dev php7.0-enchant \
                php7.0-fpm php7.0-gd php7.0-gmp php7.0-imap php7.0-interbase php7.0-intl php7.0-json php7.0-ldap php7.0-mbstring \
                php7.0-mcrypt php7.0-mysql php7.0-odbc php7.0-opcache php7.0-pgsql php7.0-phpdbg php7.0-pspell php7.0-readline \
                php7.0-recode php7.0-snmp php7.0-soap php7.0-sqlite3 php7.0-sybase php7.0-tidy php7.0-xml php7.0-xmlrpc php7.0-xsl \
                php7.0-zip php7.0-imagick php7.0-memcached php7.0-redis libapache2-mod-php7.0
                echo "Configure php.ini for CLI"
                sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.0/cli/php.ini
                sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.0/cli/php.ini
                sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.0/cli/php.ini
                sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/7.0/cli/php.ini
                echo "Configure Xdebug"
                echo "xdebug.remote_enable = 1" >> /etc/php/7.0/mods-available/xdebug.ini
                echo "xdebug.remote_connect_back = 1" >> /etc/php/7.0/mods-available/xdebug.ini
                echo "xdebug.remote_port = 9000" >> /etc/php/7.0/mods-available/xdebug.ini
                echo "xdebug.max_nesting_level = 512" >> /etc/php/7.0/mods-available/xdebug.ini
                echo "opcache.revalidate_freq = 0" >> /etc/php/7.0/mods-available/opcache.ini
                echo "Configure php.ini for FPM"
                sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.0/fpm/php.ini
                sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.0/fpm/php.ini
                sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.0/fpm/php.ini
                sed -i "s/;max_input_vars = .*/max_input_vars = 1500/" /etc/php/7.0/fpm/php.ini
                sed -i "s/max_execution_time = .*/max_execution_time = 240/" /etc/php/7.0/fpm/php.ini
                sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.0/fpm/php.ini
                sed -i "s/upload_max_filesize = .*/upload_max_filesize = 100M/" /etc/php/7.0/fpm/php.ini
                sed -i "s/post_max_size = .*/post_max_size = 100M/" /etc/php/7.0/fpm/php.ini
                sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/7.0/fpm/php.ini
                printf "[openssl]\n" | tee -a /etc/php/7.0/fpm/php.ini
                printf "openssl.cainfo = /etc/ssl/certs/ca-certificates.crt\n" | tee -a /etc/php/7.0/fpm/php.ini
                printf "[curl]\n" | tee -a /etc/php/7.0/fpm/php.ini
                printf "curl.cainfo = /etc/ssl/certs/ca-certificates.crt\n" | tee -a /etc/php/7.0/fpm/php.ini
                echo "Configure FPM"
                sed -i "s/user = www-data/user = ${USER}/" /etc/php/7.0/fpm/pool.d/www.conf
                sed -i "s/group = www-data/group = ${USER}/" /etc/php/7.0/fpm/pool.d/www.conf
                sed -i "s/listen\.owner.*/listen.owner = ${USER}/" /etc/php/7.0/fpm/pool.d/www.conf
                sed -i "s/listen\.group.*/listen.group = ${USER}/" /etc/php/7.0/fpm/pool.d/www.conf
                sed -i "s/;listen\.mode.*/listen.mode = 0666/" /etc/php/7.0/fpm/pool.d/www.conf
                echo "PHP 7.1"
                apt-get install -y --allow-change-held-packages \
                php7.1-bcmath php7.1-bz2 php7.1-cgi php7.1-cli php7.1-common php7.1-curl php7.1-dba php7.1-dev php7.1-enchant \
                php7.1-fpm php7.1-gd php7.1-gmp php7.1-imap php7.1-interbase php7.1-intl php7.1-json php7.1-ldap php7.1-mbstring \
                php7.1-mcrypt php7.1-mysql php7.1-odbc php7.1-opcache php7.1-pgsql php7.1-phpdbg php7.1-pspell php7.1-readline \
                php7.1-recode php7.1-snmp php7.1-soap php7.1-sqlite3 php7.1-sybase php7.1-tidy php7.1-xdebug php7.1-xml php7.1-xmlrpc \
                php7.1-xsl php7.1-zip php7.1-imagick php7.1-memcached php7.1-redis libapache2-mod-php7.1
                echo "Configure php.ini for CLI"
                sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.1/cli/php.ini
                sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.1/cli/php.ini
                sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.1/cli/php.ini
                sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/7.1/cli/php.ini
                echo "Configure Xdebug"
                echo "xdebug.remote_enable = 1" >> /etc/php/7.1/mods-available/xdebug.ini
                echo "xdebug.remote_connect_back = 1" >> /etc/php/7.1/mods-available/xdebug.ini
                echo "xdebug.remote_port = 9000" >> /etc/php/7.1/mods-available/xdebug.ini
                echo "xdebug.max_nesting_level = 512" >> /etc/php/7.1/mods-available/xdebug.ini
                echo "opcache.revalidate_freq = 0" >> /etc/php/7.1/mods-available/opcache.ini
                echo "Configure php.ini for FPM"
                sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.1/fpm/php.ini
                sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.1/fpm/php.ini
                sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.1/fpm/php.ini
                sed -i "s/;max_input_vars = .*/max_input_vars = 1500/" /etc/php/7.1/fpm/php.ini
                sed -i "s/max_execution_time = .*/max_execution_time = 240/" /etc/php/7.1/fpm/php.ini
                sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.1/fpm/php.ini
                sed -i "s/upload_max_filesize = .*/upload_max_filesize = 100M/" /etc/php/7.1/fpm/php.ini
                sed -i "s/post_max_size = .*/post_max_size = 100M/" /etc/php/7.1/fpm/php.ini
                sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/7.1/fpm/php.ini
                printf "[openssl]\n" | tee -a /etc/php/7.1/fpm/php.ini
                printf "openssl.cainfo = /etc/ssl/certs/ca-certificates.crt\n" | tee -a /etc/php/7.1/fpm/php.ini
                printf "[curl]\n" | tee -a /etc/php/7.1/fpm/php.ini
                printf "curl.cainfo = /etc/ssl/certs/ca-certificates.crt\n" | tee -a /etc/php/7.1/fpm/php.ini
                echo "Configure FPM"
                sed -i "s/user = www-data/user = ${USER}/" /etc/php/7.1/fpm/pool.d/www.conf
                sed -i "s/group = www-data/group = ${USER}/" /etc/php/7.1/fpm/pool.d/www.conf
                sed -i "s/listen\.owner.*/listen.owner = ${USER}/" /etc/php/7.1/fpm/pool.d/www.conf
                sed -i "s/listen\.group.*/listen.group = ${USER}/" /etc/php/7.1/fpm/pool.d/www.conf
                sed -i "s/;listen\.mode.*/listen.mode = 0666/" /etc/php/7.1/fpm/pool.d/www.conf
                echo "PHP 7.2"
                apt-get install -y --allow-change-held-packages \
                php7.2-bcmath php7.2-bz2 php7.2-dba php7.2-enchant php7.2-fpm php7.2-imap php7.2-interbase php7.2-intl \
                php7.2-mbstring php7.2-phpdbg php7.2-soap php7.2-sybase php7.2-xsl php7.2-zip php7.2-cgi php7.2-cli php7.2-common \
                php7.2-curl php7.2-dev php7.2-gd php7.2-gmp php7.2-json php7.2-ldap php7.2-mysql php7.2-odbc php7.2-opcache \
                php7.2-pgsql php7.2-pspell php7.2-readline php7.2-recode php7.2-snmp php7.2-sqlite3 php7.2-tidy php7.2-xdebug \
                php7.2-xml php7.2-xmlrpc php7.2-imagick php7.2-memcached php7.2-redis libapache2-mod-php7.2
                echo "Configure php.ini for CLI""
                sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.2/cli/php.ini
                sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.2/cli/php.ini
                sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.2/cli/php.ini
                sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/7.2/cli/php.ini
                echo "Configure Xdebug
                echo "xdebug.mode = debug" >> /etc/php/7.2/mods-available/xdebug.ini
                echo "xdebug.discover_client_host = true" >> /etc/php/7.2/mods-available/xdebug.ini
                echo "xdebug.client_port = 9003" >> /etc/php/7.2/mods-available/xdebug.ini
                echo "xdebug.max_nesting_level = 512" >> /etc/php/7.2/mods-available/xdebug.ini
                echo "opcache.revalidate_freq = 0" >> /etc/php/7.2/mods-available/opcache.ini
                echo "Configure php.ini for FPM"
                sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.2/fpm/php.ini
                sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.2/fpm/php.ini
                sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.2/fpm/php.ini
                sed -i "s/; max_input_vars = .*/max_input_vars = 1500/" /etc/php/7.2/fpm/php.ini
                sed -i "s/max_execution_time = .*/max_execution_time = 240/" /etc/php/7.2/fpm/php.ini
                sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.2/fpm/php.ini
                sed -i "s/upload_max_filesize = .*/upload_max_filesize = 100M/" /etc/php/7.2/fpm/php.ini
                sed -i "s/post_max_size = .*/post_max_size = 100M/" /etc/php/7.2/fpm/php.ini
                sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/7.2/fpm/php.ini
                printf "[openssl]\n" | tee -a /etc/php/7.2/fpm/php.ini
                printf "openssl.cainfo = /etc/ssl/certs/ca-certificates.crt\n" | tee -a /etc/php/7.2/fpm/php.ini
                printf "[curl]\n" | tee -a /etc/php/7.2/fpm/php.ini
                printf "curl.cainfo = /etc/ssl/certs/ca-certificates.crt\n" | tee -a /etc/php/7.2/fpm/php.ini
                echo "Configure FPM"
                sed -i "s/user = www-data/user = ${USER}/" /etc/php/7.2/fpm/pool.d/www.conf
                sed -i "s/group = www-data/group = ${USER}/" /etc/php/7.2/fpm/pool.d/www.conf
                sed -i "s/listen\.owner.*/listen.owner = ${USER}/" /etc/php/7.2/fpm/pool.d/www.conf
                sed -i "s/listen\.group.*/listen.group = ${USER}/" /etc/php/7.2/fpm/pool.d/www.conf
                sed -i "s/;listen\.mode.*/listen.mode = 0666/" /etc/php/7.2/fpm/pool.d/www.conf
                echo "PHP 7.3"
                apt-get install -y --allow-change-held-packages \
                php7.3 php7.3-bcmath php7.3-bz2 php7.3-cgi php7.3-cli php7.3-common php7.3-curl php7.3-dba php7.3-dev php7.3-enchant \
                php7.3-fpm php7.3-gd php7.3-gmp php7.3-imap php7.3-interbase php7.3-intl php7.3-json php7.3-ldap php7.3-mbstring \
                php7.3-mysql php7.3-odbc php7.3-opcache php7.3-pgsql php7.3-phpdbg php7.3-pspell php7.3-readline php7.3-recode \
                php7.3-snmp php7.3-soap php7.3-sqlite3 php7.3-sybase php7.3-tidy php7.3-xdebug php7.3-xml php7.3-xmlrpc php7.3-xsl \
                php7.3-zip php7.3-imagick php7.3-memcached php7.3-redis libapache2-mod-php7.3
                echo "Configure php.ini for CLI"
                sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.3/cli/php.ini
                sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.3/cli/php.ini
                sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.3/cli/php.ini
                sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/7.3/cli/php.ini
                echo "Configure Xdebug"
                echo "xdebug.mode = debug" >> /etc/php/7.3/mods-available/xdebug.ini
                echo "xdebug.discover_client_host = true" >> /etc/php/7.3/mods-available/xdebug.ini
                echo "xdebug.client_port = 9003" >> /etc/php/7.3/mods-available/xdebug.ini
                echo "xdebug.max_nesting_level = 512" >> /etc/php/7.3/mods-available/xdebug.ini
                echo "opcache.revalidate_freq = 0" >> /etc/php/7.3/mods-available/opcache.ini
                echo "Configure php.ini for FPM"
                sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.3/fpm/php.ini
                sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.3/fpm/php.ini
                sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.3/fpm/php.ini
                sed -i "s/;max_input_vars = .*/max_input_vars = 1500/" /etc/php/7.3/fpm/php.ini
                sed -i "s/max_execution_time = .*/max_execution_time = 240/" /etc/php/7.3/fpm/php.ini
                sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.3/fpm/php.ini
                sed -i "s/upload_max_filesize = .*/upload_max_filesize = 100M/" /etc/php/7.3/fpm/php.ini
                sed -i "s/post_max_size = .*/post_max_size = 100M/" /etc/php/7.3/fpm/php.ini
                sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/7.3/fpm/php.ini
                printf "[openssl]\n" | tee -a /etc/php/7.3/fpm/php.ini
                printf "openssl.cainfo = /etc/ssl/certs/ca-certificates.crt\n" | tee -a /etc/php/7.3/fpm/php.ini
                printf "[curl]\n" | tee -a /etc/php/7.3/fpm/php.ini
                printf "curl.cainfo = /etc/ssl/certs/ca-certificates.crt\n" | tee -a /etc/php/7.3/fpm/php.ini
                echo "Configure FPM"
                sed -i "s/user = www-data/user = ${USER}/" /etc/php/7.3/fpm/pool.d/www.conf
                sed -i "s/group = www-data/group = ${USER}/" /etc/php/7.3/fpm/pool.d/www.conf
                sed -i "s/listen\.owner.*/listen.owner = ${USER}/" /etc/php/7.3/fpm/pool.d/www.conf
                sed -i "s/listen\.group.*/listen.group = ${USER}/" /etc/php/7.3/fpm/pool.d/www.conf
                sed -i "s/;listen\.mode.*/listen.mode = 0666/" /etc/php/7.3/fpm/pool.d/www.conf
                echo "PHP 7.4"
                apt-get install -y --allow-change-held-packages \
                php7.4 php7.4-bcmath php7.4-bz2 php7.4-cgi php7.4-cli php7.4-common php7.4-curl php7.4-dba php7.4-dev \
                php7.4-enchant php7.4-fpm php7.4-gd php7.4-gmp php7.4-imap php7.4-interbase php7.4-intl php7.4-json php7.4-ldap \
                php7.4-mbstring php7.4-mysql php7.4-odbc php7.4-opcache php7.4-pgsql php7.4-phpdbg php7.4-pspell php7.4-readline \
                php7.4-snmp php7.4-soap php7.4-sqlite3 php7.4-sybase php7.4-tidy php7.4-xdebug php7.4-xml php7.4-xmlrpc php7.4-xsl \
                php7.4-zip php7.4-imagick php7.4-memcached php7.4-redis libapache2-mod-php7.4
                echo "Configure php.ini for CLI"
                sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.4/cli/php.ini
                sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.4/cli/php.ini
                sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.4/cli/php.ini
                sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/7.4/cli/php.ini
                echo "Configure Xdebug"
                echo "xdebug.mode = debug" >> /etc/php/7.4/mods-available/xdebug.ini
                echo "xdebug.discover_client_host = true" >> /etc/php/7.4/mods-available/xdebug.ini
                echo "xdebug.client_port = 9003" >> /etc/php/7.4/mods-available/xdebug.ini
                echo "xdebug.max_nesting_level = 512" >> /etc/php/7.4/mods-available/xdebug.ini
                echo "opcache.revalidate_freq = 0" >> /etc/php/7.4/mods-available/opcache.ini
                echo "Configure php.ini for FPM"
                sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.4/fpm/php.ini
                sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.4/fpm/php.ini
                sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.4/fpm/php.ini
                sed -i "s/;max_input_vars = .*/max_input_vars = 1500/" /etc/php/7.4/fpm/php.ini
                sed -i "s/max_execution_time = .*/max_execution_time = 240/" /etc/php/7.4/fpm/php.ini
                sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.4/fpm/php.ini
                sed -i "s/upload_max_filesize = .*/upload_max_filesize = 100M/" /etc/php/7.4/fpm/php.ini
                sed -i "s/post_max_size = .*/post_max_size = 100M/" /etc/php/7.4/fpm/php.ini
                sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/7.4/fpm/php.ini
                printf "[openssl]\n" | tee -a /etc/php/7.4/fpm/php.ini
                printf "openssl.cainfo = /etc/ssl/certs/ca-certificates.crt\n" | tee -a /etc/php/7.4/fpm/php.ini
                printf "[curl]\n" | tee -a /etc/php/7.4/fpm/php.ini
                printf "curl.cainfo = /etc/ssl/certs/ca-certificates.crt\n" | tee -a /etc/php/7.4/fpm/php.ini
                echo "Configure FPM"
                sed -i "s/user = www-data/user = ${USER}/" /etc/php/7.4/fpm/pool.d/www.conf
                sed -i "s/group = www-data/group = ${USER}/" /etc/php/7.4/fpm/pool.d/www.conf
                sed -i "s/listen\.owner.*/listen.owner = ${USER}/" /etc/php/7.4/fpm/pool.d/www.conf
                sed -i "s/listen\.group.*/listen.group = ${USER}/" /etc/php/7.4/fpm/pool.d/www.conf
                sed -i "s/;listen\.mode.*/listen.mode = 0666/" /etc/php/7.4/fpm/pool.d/www.conf
                echo "PHP 8.0"
                apt-get install -y --allow-change-held-packages \
                php8.0 php8.0-bcmath php8.0-bz2 php8.0-cgi php8.0-cli php8.0-common php8.0-curl php8.0-dba php8.0-dev \
                php8.0-enchant php8.0-fpm php8.0-gd php8.0-gmp php8.0-imap php8.0-interbase php8.0-intl php8.0-ldap \
                php8.0-mbstring php8.0-mysql php8.0-odbc php8.0-opcache php8.0-pgsql php8.0-phpdbg php8.0-pspell php8.0-readline \
                php8.0-snmp php8.0-soap php8.0-sqlite3 php8.0-sybase php8.0-tidy php8.0-xdebug php8.0-xml php8.0-xmlrpc php8.0-xsl \
                php8.0-zip php8.0-memcached php8.0-redis libapache2-mod-php8.0
                echo "Configure php.ini for CLI"
                sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/8.0/cli/php.ini
                sed -i "s/display_errors = .*/display_errors = On/" /etc/php/8.0/cli/php.ini
                sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/8.0/cli/php.ini
                sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/8.0/cli/php.ini
                echo "Configure Xdebug"
                echo "xdebug.mode = debug" >> /etc/php/8.0/mods-available/xdebug.ini
                echo "xdebug.discover_client_host = true" >> /etc/php/8.0/mods-available/xdebug.ini
                echo "xdebug.client_port = 9003" >> /etc/php/8.0/mods-available/xdebug.ini
                echo "xdebug.max_nesting_level = 512" >> /etc/php/8.0/mods-available/xdebug.ini
                echo "opcache.revalidate_freq = 0" >> /etc/php/8.0/mods-available/opcache.ini
                echo "Configure php.ini for FPM"
                sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/8.0/fpm/php.ini
                sed -i "s/display_errors = .*/display_errors = On/" /etc/php/8.0/fpm/php.ini
                sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/8.0/fpm/php.ini
                sed -i "s/;max_input_vars = .*/max_input_vars = 1500/" /etc/php/8.0/fpm/php.ini
                sed -i "s/max_execution_time = .*/max_execution_time = 240/" /etc/php/8.0/fpm/php.ini
                sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/8.0/fpm/php.ini
                sed -i "s/upload_max_filesize = .*/upload_max_filesize = 100M/" /etc/php/8.0/fpm/php.ini
                sed -i "s/post_max_size = .*/post_max_size = 100M/" /etc/php/8.0/fpm/php.ini
                sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/8.0/fpm/php.ini
                printf "[openssl]\n" | tee -a /etc/php/8.0/fpm/php.ini
                printf "openssl.cainfo = /etc/ssl/certs/ca-certificates.crt\n" | tee -a /etc/php/8.0/fpm/php.ini
                printf "[curl]\n" | tee -a /etc/php/8.0/fpm/php.ini
                printf "curl.cainfo = /etc/ssl/certs/ca-certificates.crt\n" | tee -a /etc/php/8.0/fpm/php.ini
                echo "Configure FPM"
                sed -i "s/user = www-data/user = ${USER}/" /etc/php/8.0/fpm/pool.d/www.conf
                sed -i "s/group = www-data/group = ${USER}/" /etc/php/8.0/fpm/pool.d/www.conf
                sed -i "s/listen\.owner.*/listen.owner = ${USER}/" /etc/php/8.0/fpm/pool.d/www.conf
                sed -i "s/listen\.group.*/listen.group = ${USER}/" /etc/php/8.0/fpm/pool.d/www.conf
                sed -i "s/;listen\.mode.*/listen.mode = 0666/" /etc/php/8.0/fpm/pool.d/www.conf
                echo "PHP 8.1"
                apt-get install -y --allow-change-held-packages \
                php8.1 php8.1-bcmath php8.1-bz2 php8.1-cgi php8.1-cli php8.1-common php8.1-curl php8.1-dba php8.1-dev \
                php8.1-enchant php8.1-fpm php8.1-gd php8.1-gmp php8.1-imap php8.1-interbase php8.1-intl php8.1-ldap \
                php8.1-mbstring php8.1-mysql php8.1-odbc php8.1-opcache php8.1-pgsql php8.1-phpdbg php8.1-pspell php8.1-readline \
                php8.1-snmp php8.1-soap php8.1-sqlite3 php8.1-sybase php8.1-tidy php8.1-xdebug php8.1-xml php8.1-xmlrpc php8.1-xsl \
                php8.1-zip php8.1-memcached php8.1-redis libapache2-mod-php8.1
                echo "Configure php.ini for CLI"
                sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/8.1/cli/php.ini
                sed -i "s/display_errors = .*/display_errors = On/" /etc/php/8.1/cli/php.ini
                sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/8.1/cli/php.ini
                sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/8.1/cli/php.ini
                echo "Configure Xdebug"
                echo "xdebug.mode = debug" >> /etc/php/8.1/mods-available/xdebug.ini
                echo "xdebug.discover_client_host = true" >> /etc/php/8.1/mods-available/xdebug.ini
                echo "xdebug.client_port = 9003" >> /etc/php/8.1/mods-available/xdebug.ini
                echo "xdebug.max_nesting_level = 512" >> /etc/php/8.1/mods-available/xdebug.ini
                echo "opcache.revalidate_freq = 0" >> /etc/php/8.1/mods-available/opcache.ini
                echo "Configure php.ini for FPM"
                sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/8.1/fpm/php.ini
                sed -i "s/display_errors = .*/display_errors = On/" /etc/php/8.1/fpm/php.ini
                sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/8.1/fpm/php.ini
                sed -i "s/;max_input_vars = .*/max_input_vars = 1500/" /etc/php/8.1/fpm/php.ini
                sed -i "s/max_execution_time = .*/max_execution_time = 240/" /etc/php/8.1/fpm/php.ini
                sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/8.1/fpm/php.ini
                sed -i "s/upload_max_filesize = .*/upload_max_filesize = 100M/" /etc/php/8.1/fpm/php.ini
                sed -i "s/post_max_size = .*/post_max_size = 100M/" /etc/php/8.1/fpm/php.ini
                sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/8.1/fpm/php.ini
                printf "[openssl]\n" | tee -a /etc/php/8.1/fpm/php.ini
                printf "openssl.cainfo = /etc/ssl/certs/ca-certificates.crt\n" | tee -a /etc/php/8.1/fpm/php.ini
                printf "[curl]\n" | tee -a /etc/php/8.1/fpm/php.ini
                printf "curl.cainfo = /etc/ssl/certs/ca-certificates.crt\n" | tee -a /etc/php/8.1/fpm/php.ini
                echo "Configure FPM"
                sed -i "s/user = www-data/user = ${USER}/" /etc/php/8.1/fpm/pool.d/www.conf
                sed -i "s/group = www-data/group = ${USER}/" /etc/php/8.1/fpm/pool.d/www.conf
                sed -i "s/listen\.owner.*/listen.owner = ${USER}/" /etc/php/8.1/fpm/pool.d/www.conf
                sed -i "s/listen\.group.*/listen.group = ${USER}/" /etc/php/8.1/fpm/pool.d/www.conf
                sed -i "s/;listen\.mode.*/listen.mode = 0666/" /etc/php/8.1/fpm/pool.d/www.conf
                echo "PHP 8.2"
                apt-get install -y --allow-change-held-packages \
                php8.2 php8.2-bcmath php8.2-bz2 php8.2-cgi php8.2-cli php8.2-common php8.2-curl php8.2-dba php8.2-dev \
                php8.2-enchant php8.2-fpm php8.2-gd php8.2-gmp php8.2-imap php8.2-interbase php8.2-intl php8.2-ldap \
                php8.2-mbstring php8.2-mysql php8.2-odbc php8.2-opcache php8.2-pgsql php8.2-phpdbg php8.2-pspell php8.2-readline \
                php8.2-snmp php8.2-soap php8.2-sqlite3 php8.2-sybase php8.2-tidy php8.2-xdebug php8.2-xml php8.2-xsl php8.2-zip \
                php8.2-memcached php8.2-redis libapache2-mod-php8.2
				echo "Configure php.ini for CLI"
                sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/8.2/cli/php.ini
                sed -i "s/display_errors = .*/display_errors = On/" /etc/php/8.2/cli/php.ini
                sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/8.2/cli/php.ini
                sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/8.2/cli/php.ini
                echo "Configure Xdebug"
                echo "xdebug.mode = debug" >> /etc/php/8.2/mods-available/xdebug.ini
                echo "xdebug.discover_client_host = true" >> /etc/php/8.2/mods-available/xdebug.ini
                echo "xdebug.client_port = 9003" >> /etc/php/8.2/mods-available/xdebug.ini
                echo "xdebug.max_nesting_level = 512" >> /etc/php/8.2/mods-available/xdebug.ini
                echo "opcache.revalidate_freq = 0" >> /etc/php/8.2/mods-available/opcache.ini
                echo "Configure php.ini for FPM"
                sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/8.2/fpm/php.ini
                sed -i "s/display_errors = .*/display_errors = On/" /etc/php/8.2/fpm/php.ini
                sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/8.2/fpm/php.ini
                sed -i "s/;max_input_vars = .*/max_input_vars = 1500/" /etc/php/8.2/fpm/php.ini
                sed -i "s/max_execution_time = .*/max_execution_time = 240/" /etc/php/8.2/fpm/php.ini
                sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/8.2/fpm/php.ini
                sed -i "s/upload_max_filesize = .*/upload_max_filesize = 100M/" /etc/php/8.2/fpm/php.ini
                sed -i "s/post_max_size = .*/post_max_size = 100M/" /etc/php/8.2/fpm/php.ini
                sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/8.2/fpm/php.ini
                printf "[openssl]\n" | tee -a /etc/php/8.2/fpm/php.ini
                printf "openssl.cainfo = /etc/ssl/certs/ca-certificates.crt\n" | tee -a /etc/php/8.2/fpm/php.ini
                printf "[curl]\n" | tee -a /etc/php/8.2/fpm/php.ini
                printf "curl.cainfo = /etc/ssl/certs/ca-certificates.crt\n" | tee -a /etc/php/8.2/fpm/php.ini
                echo "Configure FPM"
                sed -i "s/user = www-data/user = ${USER}/" /etc/php/8.2/fpm/pool.d/www.conf
                sed -i "s/group = www-data/group = ${USER}/" /etc/php/8.2/fpm/pool.d/www.conf
                sed -i "s/listen\.owner.*/listen.owner = ${USER}/" /etc/php/8.2/fpm/pool.d/www.conf
                sed -i "s/listen\.group.*/listen.group = ${USER}/" /etc/php/8.2/fpm/pool.d/www.conf
                sed -i "s/;listen\.mode.*/listen.mode = 0666/" /etc/php/8.2/fpm/pool.d/www.conf
				echo "Disable All PHP FPM Aside Of 8.0" 
                systemctl disable php7.0-fpm
                systemctl disable php7.1-fpm
                systemctl disable php7.2-fpm
                systemctl disable php7.3-fpm
                systemctl disable php7.4-fpm
				systemctl disable php8.1-fpm
				systemctl disable php8.2-fpm
                update-alternatives --set php /usr/bin/php8.0
                update-alternatives --set php-config /usr/bin/php-config8.0
                update-alternatives --set phpize /usr/bin/phpize8.0
				;;
			2)
			    #Install Apache2
				echo "Installing Apache"
				sudo apt install -y apache2
                sudo ufw allow 'Apache'
                sudo systemctl status apache2
				echo "Restarting Apache Server"
				service apache2 restart
				;;
            3)	
				#Install Build Essentials
				echo "Installing Build Essentials"
				apt install -y build-essential
				;;		
			4)
				#Install Rust
				echo "Installing Rust"
				curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh
				source $HOME/.cargo/env
				rustc --version
				sudo apt install build-essential -y
				;;
			5)
                #Install GIT
				echo "Installing GIT"
				sudo apt-get install git -y
                echo "Git Installed Successfully!"
                git config --global user.name "Daniel Hierholzer"
                git config --global user.email "dhierholzer@gmail.com"
				;;
			6)
				#Composer
				echo "Installing Composer"
                curl -sS https://getcomposer.org/installer -o composer-setup.php
                sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
                sudo chmod +x /usr/local/bin/composer
                composer -V
                ;;
	        7)
				#JDK 8
				echo "Installing JDK 8"
				sudo apt install default-jre -y
				java -version
				sudo apt install default-jdk -y
				javac -version
				;;
			8)
				#MySQL
				echo "Installing MySQL"
				sudo apt install -y mysql-server
                sudo service mysql status
                sudo mysql_secure_installation
                echo "MySQL Configured"
                sudo apt install -y phpmyadmin
                sudo cp /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
                sudo a2enconf phpmyadmin.conf

                sudo service apache2 restart
				;;
			9)
				#Ubuntu Restricted Extras
				echo "Installing Nginx"
				sudo apt install nginx -y
				sudo rm /etc/nginx/sites-enabled/default
				sudo systemctl reload nginx
				;;
			10)
				# Install Redis
				# 1st We Must Install The Supporting Packages
                sudo apt-get install build-essential -y
                sudo apt-get install tcl -y
				sudo apt-get install curl -y
				# Download and Extract the Redis Source Code
				cd /tmp
				sudo curl -O http://download.redis.io/redis-stable.tar.gz
				sudo tar xzvf redis-stable.tar.gz
				cd redis-stable
				# Build and Install Redis
				sudo make
				sudo make test
				sudo make install
				# Configure Newly Installed Redis
				sudo mkdir /etc/redis
				sudo cp /tmp/redis-stable/redis.conf /etc/redis
				sudo sed -i "s/^supervised no/supervised systemd/" /etc/redis/redis.conf
				sudo sed -i "s/^dir \.\//dir \/var\/lib\/redis/" /etc/redis/redis.conf
				# Create a Redis systemd Unit File
				sudo wget -O /etc/systemd/system/redis.service https://gist.githubusercontent.com/clzola/2b98f0b128d94811e43f86412dc375a1/raw/d2b1475ba3c44d6b3341a724166004e366a7304b/redis.service
				# Create the Redis User, Group and Directories
				sudo adduser --system --group --no-create-home redis
				sudo mkdir /var/lib/redis
				sudo chown redis:redis /var/lib/redis
				sudo chmod 770 /var/lib/redis
				# Start Redis
				sudo systemctl start redis
				# Enable Redis to Start at Boot
				sudo systemctl enable redis
				# Clean
				sudo rm -rf /tmp/redis-stable
				sudo rm /tmp/redis-stable.tar.gz
                echo "Redis Server Installed Successfully!"				
                echo "Redis Server Set to Start at boot!"					
                ;;
			11)
				#Unity tweak tool
				echo "Installing Unity Tweak Tool"
				apt install unity-tweak-tool -y
				;;
			12)
				# Install cURL & ZIP/UNZIP
                echo "Installing Unity Tweak Tool"
                sudo apt-get install curl -y
                sudo apt-get install zip unzip -y
				;;
			13)
				#Let Encrypt
				echo "Lets Encrypt"
				apt-get install certbot -y
				;;
			14)
				#Installing Larvel
				echo "Installing Larvel"
				sudo mysql
				# If /root/.my.cnf exists then it won't ask for root password
                if [ -f /root/.my.cnf ]; then
                    echo "Enter database name!"
                    read dbname
                    echo "Creating new MySQL database..."
                    mysql -e "CREATE DATABASE ${dbname} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
                    echo "Database successfully created!"
                    echo "Enter database user!"
                    read username
                    echo "Enter the PASSWORD for database user!"
                    echo "Note: password will be hidden when typing"
                    read -s userpass
                    echo "Creating new user..."
                    mysql -e "CREATE USER ${username}@localhost IDENTIFIED BY '${userpass}';"
                    echo "User successfully created!"
                    echo "Granting ALL privileges on ${dbname} to ${username}!"
                    mysql -e "GRANT ALL PRIVILEGES ON ${dbname}.* TO '${username}'@'localhost';"
                    mysql -e "FLUSH PRIVILEGES;"
                    echo "You're good now :)"
                    exit
                # If /root/.my.cnf doesn't exist then it'll ask for root password	
                else
                    echo "Please enter root user MySQL password!"
                    echo "Note: password will be hidden when typing"
                    read -s rootpasswd
                    echo "Enter database name!"
                    read dbname
                    echo "Creating new MySQL database..."
                    mysql -uroot -p${rootpasswd} -e "CREATE DATABASE ${dbname} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
                    echo "Database successfully created!"
                    echo "Enter database user!"
                    read username
                    echo "Enter the PASSWORD for database user!"
                    echo "Note: password will be hidden when typing"
                    read -s userpass
                    echo "Creating new user..."
                    mysql -uroot -p${rootpasswd} -e "CREATE USER ${username}@localhost IDENTIFIED BY '${userpass}';"
                    echo "User successfully created!"
                    echo "Granting ALL privileges on ${dbname} to ${username}!"
                    mysql -uroot -p${rootpasswd} -e "GRANT ALL PRIVILEGES ON ${dbname}.* TO '${username}'@'localhost';"
                    mysql -uroot -p${rootpasswd} -e "FLUSH PRIVILEGES;"
                    echo "You're good now :)"
                    exit
                fi
                cd /var/www
                sudo git clone https://github.com/laravel/laravel.git
                cd /var/www/laravel
                sudo composer install
                sudo chown -R www-data.www-data /var/www/laravel
                sudo chmod -R 755 /var/www/laravel
                sudo chmod -R 777 /var/www/laravel/storage
                cd /var/www/laravel
                sudo cp .env.example .env
                php artisan key:generate
                echo "Copy Database Info To ENV file, then create Apache2 Entry For Website"
				;;
			15)
				#Install Ruby
                echo "Install Ruby"
                sudo apt install ruby-full -y
                sudo ruby --version
                echo "Ruby Installation Successful"
				;;
			16)
				#Python (All Verions)
				echo "Installing Python all versions"
				sudo apt install software-properties-common
				sudo add-apt-repository ppa:deadsnakes/ppa
				sudo apt update -y && sudo apt upgrade -y
				echo "Installing Python 2"
				sudo apt install python2 -y
				echo "Installing Python 3"
				sudo apt install python3.11 -y
				sudo apt install python3.9 -y
				sudo apt install python3.7 -y
				sudo apt install python3.6 -y
				sudo apt install python3.5 -y
				sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
				sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.5 2
				sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 3
				sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.7 4
				sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.9 5
				sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.11 6	
				sudo update-alternatives --config python	
				;;
			17)
				#Install Node.js, NVM, & NPM
				echo "Installing Node.js, NVM, & NPM"
				curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
				source ~/.bashrc
				nvm install --lts
				node -v
				;;
			18)
				#Numix Icons
				echo "Installing Numic Icons"
				apt-add-repository ppa:numix/ppa -y
				apt-get update
				apt-get install numix-icon-theme numix-icon-theme-circle -y
				;;
	    esac
	done
	