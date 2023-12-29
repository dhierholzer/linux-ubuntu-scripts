#!/bin/bash
# Before Using this, you must run:  sudo mv sphp /usr/local/bin/ && sudo chmod +x /usr/local/bin/sphp
# Usage
if [ $# -ne 1 ]; then
  echo "Usage: sphp [phpversion]"
  echo "Example: sphp 7.2"
  exit 1
fi

currentversion="`php -r \"error_reporting(0); echo str_replace('.', '', substr(phpversion(), 0, 3));\"`"
newversion="$1"

majorOld=${currentversion:0:1}
minorOld=${currentversion:1:1}
majorNew=${newversion:0:1}
minorNew=${newversion:2:1}


echo "PHP version [$newversion] found"
echo "Switching from [php${currentversion}] to [php${newversion}] ... "

# Disable Current Version Of PHP
printf "a2dismod php$majorOld.$minorOld ... "
sudo a2dismod "php${majorOld}.${minorOld}"
printf "a2dismod php$majorOld.$minorOld -fpm "
sudo a2dismod "php${majorOld}.${minorOld}-fpm"
printf "[OK] and "

# Emable New Version Of PHP
printf "a2enmod php${newversion}-fpm ... "
sudo a2enmod "php${majorNew}.${minorNew}"
printf "a2enmod php${newversion}-fpm ... "
sudo a2enmod "php${majorNew}.${minorNew}-fpm"
printf "[OK]\n"

# Update Alternative Version Of PHP
printf "update-alternatives - - set php ... "
sudo update-alternatives --set php "/usr/bin/php${majorNew}.${minorNew}"
printf "[OK]\n"

# Update Alternative Version Of PHAR
printf "update-alternatives - - set phar ... "
sudo update-alternatives --set phar "/usr/bin/phar${majorNew}.${minorNew}"
printf "[OK]\n"

# Update Alternative Version Of PHAR PHAR
printf "update-alternatives - - set phar.phar ... "
sudo update-alternatives --set phar.phar "/usr/bin/phar.phar${majorNew}.${minorNew}"
printf "[OK]\n"

# Update Alternative Version Of PHPIZE
printf "update-alternatives - - set phpize ... "
sudo update-alternatives --set phpize "/usr/bin/phpize${majorNew}.${minorNew}"
printf "[OK]\n"

# Update Alternative Version Of PHP-CONFIG
printf "update-alternatives - - set php-config... "
sudo update-alternatives --set php-config "/usr/bin/php-config${majorNew}.${minorNew}"
printf "[OK]\n"

# Update Alternative Version Of PHPDBG
printf "update-alternatives - - set phpdbg... "
sudo update-alternatives --set phpdbg "/usr/bin/phpdbg${majorNew}.${minorNew}"
printf "[OK]\n"

# Update Alternative Version Of PHP-CGI
printf "update-alternatives - - set php-cgi... "
sudo update-alternatives --set php-cgi "/usr/bin/php-cgi${majorNew}.${minorNew}"
printf "[OK]\n"

# Restart Apache2
sudo service apache2 restart
printf "[OK] apache2 restarted\n"
printf "PHP Version Sucesfully Changed!\n"