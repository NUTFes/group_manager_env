# VagrantでRailsアプリが動く環境を作る

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
$ git clone https://github.com/ShuzoN/rails_practice.git
$ ls 
... rails_practice

$ cd rails_practice
```

### vagrantで仮想マシンの作成

vagrantを使い, virtualbox上に仮想マシンを作成する.  
使用するOSは``Ubuntu 14.04``  

Vagrantは``Vagrantfile``があるディレクトリでないと,  
動かないことに注意

```
$ pwd
/Users/yourname/workspace/rails_practice
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

#### サーバ起動(ゲストOS)

```
# vagrant up時にrailsのプロジェクトを作成している
$ cd ~/rails/rails_practice
# hostから接続するためにbindが必須
$ bundle exec rails server --bind=0.0.0.0
```

#### ホストOSのブラウザからアクセス

** ※ ホストOSのブラウザのプロキシをoffにすること! **  
systemとは別にプロキシ設定を行える``firefox``がお勧め  


1. ブラウザを開く(プロキシ設定をoff)
2. ``http://192.168.56.3:3000/``にアクセス
3. "Welcome aboard"が開けば成功


