export http_proxy=http://proxy.nagaokaut.ac.jp:8080/
export HTTP_PROXY=$http_proxy
export https_proxy=$http_proxy
export HTTPS_PROXY=$http_proxy
export ftp_proxy=$http_proxy
export FTP_PROXY=$http_proxy
export no_proxy=.local,169.254/16,10.10.10.10,127.0.0.1
export use_proxy=yes
git config --global http.proxy proxy.nagaokaut.ac.jp:8080

HOME="/home/vagrant"
ln -sf $HOME/dotfiles/.wgetrc $HOME/.wgetrc
ln -sf $HOME/dotfiles/.curlrc $HOME/.curlrc
echo 'vagrant' | sudo ln -sf $HOME/dotfiles/apt.conf /etc/apt/apt.conf

echo "NUT proxy enable, linked wgetrc, linked curlrc"
