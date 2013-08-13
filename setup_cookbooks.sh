mkdir cookbooks
cd cookbooks
git clone https://github.com/opscode-cookbooks/wordpress.git
git clone https://github.com/opscode-cookbooks/apache2.git
git clone https://github.com/opscode-cookbooks/mysql.git
git clone https://github.com/opscode-cookbooks/openssl.git
git clone https://github.com/opscode-cookbooks/build-essential.git
git clone https://github.com/opscode-cookbooks/php.git
echo "*******************************************************************************"
echo "** NOW COMMENT OUT THAT MESSAGE LOGGING LINE IN WORDPRESS/RECIPES/DEFAULT.RB!**"
echo "*******************************************************************************"