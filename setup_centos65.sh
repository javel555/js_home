

# change japan local
cp /usr/share/zoneinfo/Japan /etc/localtime
# ntpd start
/etc/init.d/ntpd start
chkconfig ntpd on


# update packages
yum update -y


# install rbenv
rm -rf /usr/local/rbenv
git clone git://github.com/sstephenson/rbenv.git /usr/local/rbenv
git clone git://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build
# set path rbenv
echo 'export PATH="/usr/local/ebenv/bin:$PATH"' >> /etc/profile.d/env.sh
source /etc/profile
/bin/sh /usr/local/rbenv/plugins/ruby-build/install.sh


# install ruby
yum install -y gcc openssl-devel readline-devel zlib-devel
rbenv install 2.3.1
rbenv rehash
rbenv global 2.3.1


# install bundler
rbenv exec gem update --system
rbenv exec gem install bundler


# install epel for redis and nodejs
yum install epel-release
# install and setup redis
yum install --enablerepo=epel redis
service redis start
chkconfig redis on
# install nodejs
yum install --enablerepo=epel nodejs


# install mysql
yum -y install http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
yum -y install mysql-community-server
yum -y install mysql-devel
service mysqld start
chkconfig mysqld on
