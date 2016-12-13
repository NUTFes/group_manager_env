unset http_proxy
unset HTTP_PROXY
unset https_proxy
unset HTTPS_PROXY
unset ftp_proxy
unset FTP_PROXY
unset no_proxy
export use_proxy=no
git config --global http.proxy ""

echo "NUT proxy disable"
HOME="/home/vagrant"

#heck file exist -e
[ -e $HOME/.wgetrc ] && unlink $HOME/.wgetrc && echo "wgetrc is deleted"
[ -e $HOME/.curlrc ] && unlink $HOME/.curlrc && echo "curlrc is deleted"
[ -e /etc/apt/apt.conf ] && echo 'vagrant' | sudo unlink /etc/apt/apt.conf && echo "apt.conf is deleted"

