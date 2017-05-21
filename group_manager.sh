# --- group-managerアプリ環境設定 ---
echo '---------------------------------------'
echo group-manager
echo '---------------------------------------'
source /vagrant/change_proxy.sh
home_path="/home/vagrant"
cd $home_path
# アプリに必要なaptパッケージの追加
# gcc4.9が必要
sudo -E add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo -E apt-get update
sudo -E apt-get install -yf libstdc++-4.8-dev libdpkg-perl dpkg-dev build-essential libpq-dev gcc-4.9 g++-4.9 nodejs nodejs-dev postgresql-9.3 libpq-dev g++
sudo -E update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 10
sudo -E update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 20
sudo -E update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 10
sudo -E update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 20
sudo -E update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 10
sudo -E update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 20
sudo rm /usr/bin/cpp
sudo -E update-alternatives --install /usr/bin/cpp cpp /usr/bin/cpp-4.8 10
sudo -E update-alternatives --install /usr/bin/cpp cpp /usr/bin/cpp-4.9 20
sudo -E update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30
sudo -E update-alternatives --set cc /usr/bin/gcc
sudo -E update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30
sudo -E update-alternatives --set c++ /usr/bin/g++


## postgresqlの設定
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-16-04
# http://www.dbonline.jp/postgresql/role/index2.html 

sudo -E /etc/init.d/postgresql start
# vagrantユーザの作成
sudo -u postgres createuser -d -l -r -s -w vagrant
echo 'export PGDATA=/var/lib/postgresql/data' >> $home_path/.bashrc
source $home_path/.bashrc

sudo -E mkdir /var/lib/postgresql/data
sudo -E chown vagrant /var/lib/postgresql/data/
/usr/lib/postgresql/9.3/bin/initdb -D /var/lib/postgresql/data --encoding=UTF-8 --locale=ja_JP.UTF-8
/usr/lib/postgresql/9.3/bin/pg_ctl -D /var/lib/postgresql/data -l logfile start

#group-managerのセットアップ
git clone https://github.com/NUTFes/group-manager.git
cd $home_path/group-manager
$home_path/.rbenv/shims/bundle install --path vendor/bundle
$home_path/.rbenv/shims/bundle exec rake db:create
$home_path/.rbenv/shims/bundle exec rake db:migrate
$home_path/.rbenv/shims/bundle exec rake db:seed_fu
cat /vagrant/set_env_val.sh  >> .bashrc
source $home_path/.bashrc

echo '---------------------------------------'
echo  Success!!!  provision was done. 
echo  you should set .bashrc ENV variables to send email. 
echo  please show the repository. 
echo  https://github.com/NUTFes/group-manager/tree/caff009bef19eb6f2b7e99a1321e31bca84451ee

echo and you want to lunch the rails server, enter it.
echo 
echo bundle exec rails server --bind=0.0.0.0
echo '---------------------------------------'

