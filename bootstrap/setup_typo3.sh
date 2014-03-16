cd /srv/http/

echo "### creating typo3 environment ###"
sudo mkdir typo3
sudo chown vagrant:vagrant typo3/
cd typo3

echo "### pulling typo3 from git ###"
git clone https://git.typo3.org/Packages/TYPO3.CMS.git

shopt -s dotglob
mv TYPO3.CMS/* .
rmdir TYPO3.CMS
wget -O dummy.tar.gz http://downloads.sourceforge.net/project/typo3/TYPO3%20Source%20and%20Dummy/TYPO3%206.1.7/dummy-6.1.7.tar.gz?r=http%3A%2F%2Ftypo3.org%2Fdownload%2F