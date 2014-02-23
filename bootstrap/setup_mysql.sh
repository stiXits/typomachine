cd /vagrant/bootstrap

echo "### setting global my.cnf ###"
sudo cp config/my.cnf /etc/mysql/my.cnf

echo "### starting mysqld daemon ###"
sudo systemctl start mysqld
sudo systemctl enable mysqld

echo "### triggering mysql configuration ###"
sudo ./setup_secure_mysql_silent.sh

echo "### standard configuration: ###"
echo "### user: root passwd: toor ###"
echo "### user: flow passwd: flow ###"

echo "### establishing mysql standard configuration ###"
mysql -u root -ptoor < config/mysql_standard_configuration.sql

echo "### restarting daemon ###"
sudo systemctl restart mysqld

cd /vagrant