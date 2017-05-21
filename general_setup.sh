# --- 全般的な環境設定 ---
echo '---------------------------------------'
echo 'general env setup'
echo '---------------------------------------'
home_path="/home/vagrant"
# bashプロンプトの設定
echo 'export PS1="\u@\h:\w\n\$ "' >> ${home_path}/.bashrc
# プロキシ設定
cp /vagrant/change_proxy.sh ${home_path}/.
source /vagrant/change_proxy.sh
# gcc4.9用にaptリポジトリの追加
add-apt-repository -y ppa:ubuntu-toolchain-r/test
apt-get update
# CUIエディタ導入
apt-get install -y vim emacs
apt-get install git -y --force-yes
