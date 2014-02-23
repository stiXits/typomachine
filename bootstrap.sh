# Configure .bash_profile
echo "cd /vagrant" > ~vagrant/.bash_profile

#add user vagrant to group http
sudo usermod -aG http vagrant

cd /vagrant
./bootstrap/setup_all.sh