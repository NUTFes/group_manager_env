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
sudo -E apt-get install -y libstdc++-4.8-dev libdpkg-perl dpkg-dev build-essential libpq-dev gcc-4.9 g++-4.9 nodejs nodejs-dev postgresql-9.3
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

/etc/init.d/postgresql start
# vagrantユーザの作成
sudo -u postgres createuser -d -l -r -s -w vagrant
echo 'export PGDATA=/var/lib/postgresql/data' > $home_path/.bashrc



