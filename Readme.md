# group-managerアプリ開発環境

### やってること
``virtualbox`` という仮想マシンツールの上に, linuxを入れて  
その上に``NUTFes/group-manager``というWebアプリをビルドする.   
``vagrant`` は自動で環境構築をやってくれるツール.  


### 必要なツール
vagrantとvirtualboxはよしなに入れてください
バージョンは最新を使ってください

 * vagrant http://localhost:3000/user_details/10000014
 * virtualbox https://www.virtualbox.org/

### リポジトリのクローン

vagrantの設定ファイルがあるリポジトリからファイルを``git clone``

``git clone``がうまくいかない場合はgitのプロキシを設定する  
学内であれば, ``yourproxy.com``の部分に学内のプロキシを設定  
```
git config --global https.proxy http://proxy.yourproxy.com:8080
```

その後, 以下のコマンドを打つ
```
$ git clone https://github.com/NUTFes/group_manager_env.git
$ cd ./group_manager_env
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
# ログは``./log.txt``に残る
```

あとは, 待っていれば仮想マシンが作成される.  

``vagrant up / halt / provision / ssh / destory``あたりは使うので調べると幸せになれる. 

#### ゲストマシン, ホストマシン
仮想マシン(virtual machine)をゲストマシン(ゲストOS, vm),  
元々パソコンで動いていたマシンをホストマシン(ホストOS)と呼ぶ

### ゲストOSに接続

sshを使ってゲストマシンに接続

```
# vagranfileがあるディレクトリ
$ vagrant ssh
```

### サーバの立て方

```
sshでログインした状態で
$ bundle exec rails server --bind=0.0.0.0
```

ホストマシンのブラウザから``http://localhost:3000``に接続すればvagrant内のサーバに繋がる
ブラウザのプロキシ設定はoffにすること

### メール設定について
``NUTFes/group-manager``では, アカウント作成時に確認メールが送信される.   
ローカル開発環境ではサーバの環境変数を読んでいる.  
ゲストマシン内の``~/set_env_variable.sh``の中を編集する.   
このファイルはgithubにあげるとパスワード漏れるのであげないこと  

### group-managerについて
https://github.com/NUTFes/group-manager/blob/develop/docs/setup.md

### vagrant の便利機能と運用

vagrantは共有フォルダを自動で作成してくれる. 

ホストマシンの``Vagrantfile``があるディレクトリを  
ゲストマシンの``/vagrant``としてコピーしてくれる.  

基本的には, ホスト -> ゲストの方向でファイル共有する運用

開発環境に影響があるファイルについてはホストマシン側でファイル編集 / git管理をして,  
ゲストマシンは共有フォルダからファイルを読む/コピーするだけの設計

管理するリポジトリが1つになり運用が楽になる.

