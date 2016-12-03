# --- group-managerアプリ環境設定 ---
echo '---------------------------------------'
echo rails_practice
echo '---------------------------------------'
source /vagrant/change_proxy.sh
home_path="/home/vagrant"
cd $home_path
# アプリに必要なaptパッケージの追加
# gcc4.9が必要
sudo -E add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo -E apt-get update
sudo -E apt-get install -y libstdc++-4.8-dev libdpkg-perl dpkg-dev build-essential libpq-dev gcc-4.9 g++-4.9
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

# sqlite3のインストール
sudo -E apt-get install -y sqlite3 libsqlite3-dev nodejs nodejs-dev

cd $home_path
mkdir /home/vagrant/rails
cd /home/vagrant/rails
cp /vagrant/Gemfile $home_path/rails/.
# アプリに必要なgem(rubyパッケージ)のインストール
/home/vagrant/.rbenv/shims/bundler install --path vendor/bundle --jobs=4
/home/vagrant/.rbenv/shims/bundler exec rails new -sB rails_practice
cd /home/vagrant/rails/rails_practice
cp /vagrant/rails_practice/Gemfile /home/vagrant/rails/rails_practice/.
/home/vagrant/.rbenv/shims/bundler install
/home/vagrant/.rbenv/shims/bundler update
/home/vagrant/.rbenv/shims/bundler exec spring binstub --all
