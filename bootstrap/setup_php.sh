cd /vagrant/bootstrap

echo "### setting mime types config ###"
sudo cp config/mime.types /etc/httpd/conf/mime.types

echo "### setting php.ini ###"
sudo cp config/php.ini /etc/php/php.ini

cd /vagrant