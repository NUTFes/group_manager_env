# Vagrantでgroup-managerアプリが動く環境を作る

### リポジトリのクローン

vagrantの設定ファイルがあるリポジトリからファイルを``git clone``

``git clone``がうまくいかない場合はgitのプロキシを設定する  
学内であれば, ``yourproxy.com``の部分に学内のプロキシを設定  
```
git config --global https.proxy http://proxy.yourproxy.com:8080
```

その後, 以下のコマンドを打つ
```
$ cd ~
$ mkdir workspace
$ cd workspace
$ git clone https://github.com/NUTFes/group_manager_env.git
$ cd group_manager_env
```

### vagrantで仮想マシンの作成

vagrantを使い, virtualbox上に仮想マシンを作成する.  
使用するOSは``Ubuntu 14.04``  

Vagrantは``Vagrantfile``があるディレクトリでないと,  
動かないことに注意

```
$ pwd
/Users/yourname/workspace/group_manager_env
$ ls
... Vagrantfile ...

$ vagrant up > log.txt
# 30~40分くらい待つ
# ログは./log.txtに残る
# スリープになると厄介なので, 動画を流す等で対策
```

あとは, 待っていれば仮想マシンが作成される.  

#### ゲストOS, ホストOS
仮想マシンで扱うOSは大体システムのOSと異なることから  
仮想マシンのことをゲストマシン, ゲストOSと呼ぶ.  

システムのOSをホストマシン, ホストOSと呼ぶ.  

### ゲストOSに接続

sshを使ってゲストOSに接続

```
# on terminal
# vagranfileがあるディレクトリ
$ vagrant ssh
```

あとは, このリポジトリを見て欲しい

https://github.com/NUTFes/group-manager/blob/develop/docs/setup.md
