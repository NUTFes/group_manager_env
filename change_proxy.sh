#!/bin/bash
test ! -f /etc/apt/apt.conf; sudo touch /etc/apt/apt.conf

export http_proxy=""
export HTTP_PROXY=""
export https_proxy=""
export HTTPS_PROXY=""

curl http://www.google.com --retry 0 --connect-timeout 2 >/dev/null 2>&1

httpproxy="http://proxy.nagaokaut.ac.jp:8080"
proxy="proxy.nagaokaut.ac.jp:8080"

if [ $? = 0 ]; then
    echo "set nut proxy"
    export http_proxy=$httpproxy
    export HTTP_PROXY=$httpproxy
    export https_proxy=$httpproxy
    export HTTPS_PROXY=$httpproxy
    git config --global http.proxy proxy.nagaokaut.ac.jp:8080

    echo -e "export http_proxy=${httpproxy}\nexport HTTP_PROXY=${httpproxy}\nexport https_proxy=${httpproxy}\nexport HTTPS_PROXY=${httpproxy}\nexport ftp_proxy=${httpproxy}\n" >> /home/vagrant/.bashrc

    echo -e "Acquire::http::proxy \""${httpproxy}"\";\nAcquire::https::proxy \""${httpproxy}"\";\nAcquire::ftp::proxy \""${httpproxy}"\";" | sudo tee /etc/apt/apt.conf > /dev/null

else
    git config --global http.proxy ""
      echo "unset proxy"
    echo -e "Acquire::http::proxy "";\nAcquire::https::proxy "";\nAcquire::ftp::proxy "";" | sudo tee /etc/apt/apt.conf > /dev/null
    echo -e "export http_proxy=''\n export HTTP_PROXY=''\n export https_proxy=''\n export HTTPS_PROXY=''\n export ftp_proxy=''\n" >> /home/vagrant/.bashrc
fi
source /home/vagrant/.bashrc

curl http://www.google.com --retry 0 --connect-timeout 2 >/dev/null 2>&1

if [ $? = 0 ]; then
  echo 'proxy setting done.'
  return 
else
  echo "change proxy abend: connecion error!"
fi
