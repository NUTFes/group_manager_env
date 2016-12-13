#!/bin/bash
test ! -f /etc/apt/apt.conf; sudo touch /etc/apt/apt.conf

export http_proxy=""
export HTTP_PROXY=""
export https_proxy=""
export HTTPS_PROXY=""
[ -e $HOME/.curlrc ] && unlink $HOME/.curlrc

HOME="/home/vagrant"

curl http://www.google.com --retry 0 --connect-timeout 2 >/dev/null 2>&1

if [ $? = 0 ]; then
  source $HOME/dotfiles/bin/proxy_off.sh
else
  source $HOME/dotfiles/bin/proxy_on.sh
fi

curl http://www.google.com --retry 0 --connect-timeout 2 >/dev/null 2>&1

if [ $? = 0 ]; then
  echo "change proxy done: connecion succeeded!"
  return 
else
  echo "change proxy abend: connecion error!"
fi
