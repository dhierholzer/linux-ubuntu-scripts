#!/bin/bash
#
# This Version Of Adding Commands DOES NOT USE sudo! It is setup this way intended to be used with Proxmox; which does not permit you to use sudo.
echo "Adding Command: update, Which Allows you to just type update, and it will do apt-get update, apt-get upgrade, & apt-get autoclean"
cat >update <<'EOF'
#!/bin/bash
sh -c 'apt-get update; apt-get upgrade -y; apt-get dist-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'
echo "##"
echo "###"
echo "####"
echo "#####"
echo "####"
echo "###"
echo "##"
echo "#"
echo "STATUS: Your System Has Been Updated"
EOF
mv -f update /usr/local/bin/
chmod +x /usr/local/bin/update
echo "update - command Sucessfully Added!"

echo "Adding Command: Start Which Allows The User to Start a System Service"
cat >start <<'EOF1'
#!/bin/bash
START=${1?Error: No Service Given, Please List A Service Behind Start}
systemctl start $START
echo "Service Started"
EOF1
mv -f start /usr/local/bin/
chmod +x /usr/local/bin/start
echo "start - command Sucessfully Added!"

echo "Adding Command: Stop Which Allows The User to Stop a System Service"
cat >stop <<'EOF2'
#!/bin/bash
STOP=${1?Error: No Service Given, Please List A Service Behind Stop}
systemctl stop $STOP
echo "Service Stopped"
EOF2
mv -f stop /usr/local/bin/
chmod +x /usr/local/bin/stop
echo "stop - command Sucessfully Added!"

echo "Adding Command: Restart Which Allows The User to Restart a System Service"
cat >restart <<'EOF3'
#!/bin/bash
SERVICE=${1?Error: No Service Given, Please List A Service Behind Restart}
systemctl restart $SERVICE
echo "Service Restarted"
EOF3
mv -f restart /usr/local/bin/
chmod +x /usr/local/bin/restart
echo "restart - command Sucessfully Added!"

echo "Adding Command: Reload Which Allows The User to Reload a System Service"
cat >reload <<'EOF4'
#!/bin/bash
RELOAD=${1?Error: No Service Given, Please List A Service Behind Reload}
systemctl reload $RELOAD
echo "Service Reloaded"
EOF4
mv -f reload /usr/local/bin/
chmod +x /usr/local/bin/reload
echo "reload - command Sucessfully Added!"

echo "Adding Command: Services Which List All Current Running System Services"
cat >services <<'EOF5'
#!/bin/bash
echo "Here Is A List Of Running Services"
service --status-all | grep '\[ + \]'
echo "End Of Transmission"
EOF5
mv -f services /usr/local/bin/
chmod +x /usr/local/bin/services
echo "services - command Sucessfully Added!"


echo "Adding Command: Services Which List All Current Running System Services"
cat >services-all <<'EOF6'
#!/bin/bash
echo "Here Is A List Of Running All Services"
systemctl list-units --type=service
echo "End Of Transmission"
EOF6
mv -f services-all /usr/local/bin/
chmod +x /usr/local/bin/services-all
echo "services-all - command Sucessfully Added!"


echo "Adding Command: Services Which List All Current Running System Services"
cat >allservices <<'EOF7'
#!/bin/bash
echo "Here Is A List Of Running All Services"
systemctl list-units --type=service
echo "End Of Transmission"
EOF7
mv -f allservices /usr/local/bin/
chmod +x /usr/local/bin/allservices
echo "allservices - command Sucessfully Added!"
echo "All Scripts Have Been Added And Should Be Executable!"