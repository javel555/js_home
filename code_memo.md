# プログラムメモ


## 記述ルール
- 基本的には ` ``` ` で囲って並べる。
- 1行目に表題、2行目に検索キーワード(カンマ区切り)、3行目に本文の形をとる


```
マークダウンで改行
markdown
明示的な改行は、1行開けると実現できる。普通に改行しても、マークダウン表示だと改行されない。
```

```
マークダウンで表題
markdown
`# README` とすると表題になる。#は最大6個まで繋げられる。繋げた個数に応じて `<h1>～<h6>` になる。
```

```
マークダウンでリスト
markdown
`- 項目` とするとリスト項目を作れる。また、 `1. 改行` とすると順序付きリストになる。
入れ子のリストは

1. 項目
    - 項目

という感じでスペースを4つ付けるとできる。
```

```
Vagrantで動いているRailsをRubyMineでデバッグする。
ruby, rubymine
 1. 必要なgemのインストール
グローバルに存在すればよいので、Gemfileに書く必要はない。
gem install ruby-debug-ide
gem install debase

 2. リモートデバッグ待ち受け
`rails s -b 0.0.0.0` の代わりに
rdebug-ide --host 0.0.0.0 --port 1234 --dispatcher-port 26162 -- ./rails s -b 0.0.0.0
とする。

Fast Debugger (ruby-debug-ide 0.6.0, debase 0.2.1, file filtering is supported) listens on 0.0.0.0:1234
が表示されればアタッチの待ち受けに入る。アタッチされると `rails s` が実行される。

 3. RubyMineの設定
`Run=>Edit Configurations...` から実行環境一覧を表示する。
右上の「＋」マークを押すと、実行環境を追加できるので、 `Ruby remote debug` を選択する。

各プロパティの設定内容は以下の通り。

name: 識別用の名前
Remote host: vagrantのIP。設定次第ではlocalhostでも良いかも。
Remote port: 意味が分からなければ1234で固定
Remote root folder: リモート側のプロジェクトフォルダ
Local port: 意味が分からなければ26162で固定
Local root folder: ローカル側のプロジェクトフォルダ

 4. RubyMineからアタッチ
`Run=>Debug` から上記で作成した実行環境を実行する。
ゲストOSがリモートデバッグの待ち受けを行っていれば、 `rails s` が動き出すはず。

```

```
puts と p
ruby
`p 'hoge'` はデバッグ用らしく、2バイト文字を標準出力に出す時に、文字コードに化けるみたい。
標準出力に出す時は `puts 'hoge'`にする。
```
```
scheema.rbに従ってDB作り直し
rails
`rails db:rest RAILS_ENV=development`
```
```
db/migrateフォルダの内容を取り込み
rails
`rails db:migrate RAILS_ENV=development`
```
```
Railsのフラグメントキャッシュをクリア
rails
`rails r 'Rails.cache.clear'`
```
```
sqlファイルを取り込み
mysql
`mysql -u root rclouds-dev < db/data.sql`
```
```
短縮文章の作り方
ruby
`string[str, end]`
```
```
初期値無しの場合にデフォルト値を取り付ける
ruby
`params[:tab].presence || 1`
```
```
DB触るときのマイグレーションファイル作成
rails
`rails g migration クラス名`
```
```
環境定義
rails
gem 'dotenv-rails'を使っている場合、railsの環境定義は、 `.env.development` とかに書く。
環境定義の参照はENV['キー名']で行う。
```
```
初めてのrailsプロジェクト
1. 何かフォルダを作る
2. そのフォルダの中で`bundle init`をして、Gemfileを作成
3. Gemfileを頑張って書く #TODO
```
```
shunt
vscode
複数行まとめて編集
```
```
vscode-icons
vscode
ファイルリストにアイコンを表示する
```
```
Slim
vscode
slim形式を編集するとき用
```
```
Vagrant
vscode
Vagrantサポート
```
```
Bookmarks
vscode
エディタにブックマーク機能を付与
Ctrl+Alt+K　でブックマーク
Ctrl+P > bookmark hogehoge　でブックマークした物に対するコマンド
```
```
WebSearch
vscode
エディタからブラウザで検索
```
```
Auto-Open Markdown Preview
vscode
マークダウンを横に出しながら編集
微妙かもしれない
```
```
Git History (git log)
vscode
Gitの履歴をVsCodeから確認
ちょうべんり
```
```
setting.json
vscode
{
    // タブのスペース個数
    "editor.tabSize": 2,
    // フォントの種類
    "editor.fontFamily": "MS Gothic",
    // フォントサイズ
    "editor.fontSize": 12,
    // スペースを表示.ただし単語間の単一スペースは表示しない
    "editor.renderWhitespace": "boundary",
    // エディターでインデントのガイドを表示する必要があるかどうかを制御します
    "editor.renderIndentGuides": true,
    // メニューバーの表示要否
    "window.menuBarVisibility": "toggle",
    // 自動フォーマットする
    "editor.formatOnType": true,
    // カーソルがにゅるっと点滅する
    "editor.cursorBlinking": "smooth",
    // 制御文字を表示する
    "editor.renderControlCharacters": true,
    // 差分を横に並べて表示ではなく行内に表示する
    "diffEditor.renderSideBySide": false,
    // ファイルを自動保存
    "files.autoSave": "afterDelay",

    // Quick Openで開いたファイルはプレビューにしない方が使いやすい
    "workbench.editor.enablePreviewFromQuickOpen": false,

    // 拡張機能を自動更新
    "extensions.autoUpdate": true,
    // rubyエクステンション
    "ruby.lint" : {
        "reek" : true,
        "rubocop" : true,
        "ruby" : false,
        "fasterer": true,
        "debride" : true,
        "ruby-lint": true
    },
    // vscode-iconsで使用するアイコンテーマ
    "workbench.iconTheme": "vscode-icons",
    // エディタ内検索に使うブラウザ
    "web-search.browser": "C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe",

    // ウィンドウの拡大率
    "window.zoomLevel": 0,
    // ミニマップの横幅
    "editor.minimap.maxColumn": 50

    // マークダウンプレビューのフォントサイズ
    "markdown.preview.fontSize": 10

}
```
```
Mysqlでたくさんログを出す
mysql
vim /etc/my.cnf.d/server.cnf 
[mysqld]のブロックに ::point_down:

[mysqld]
general_log=1
general_log_file=/var/log/mysql/general-query.log

ログファイルを先に作っておく（念のため）
mkdir -p /var/log/mysql/
touch /var/log/mysql/general-query.log
chmod 777 /var/log/mysql/general-query.log

既述後　mysql再起動
`/etc/init.d/mysql restart` (edited)
```
```
ヒアドキュメントを使って、shとかでファイルの内容を含めて作る
shell
cat <<EOF > hoge.txt
hogehoge
fugafuga
EOF
```
```
CentOS6でmysqlサービスの起動
shell, mysql
service mysqld start
```
```
CentOS6でmysqlサービスを自動起動
shell, mysql
chkconfig mysqld on
```
```
Mysql5.7で初期パスワードの確認
mysql
grep 'temporary password' /var/log/mysqld.log
```
```
Mysql5.7で初期設定
mysql
mysql_secure_installation
```
```
マイグレーションファイルでカラム追加
ruby, rails, migrate
add_column [テーブル名]], [カラム名], [型], :after => [何のカラムの横に入れるか], comment: [コメント（要gem?）]
```
```
マイグレーションファイルのデバッグ
ruby, rails, migrate
rake db:migrate　で適応して、思ったのと違うなら
rake db:rollback　で戻せる
```
```
rubyで後置if
ruby
send_mail_to(user) if user.active?
```
```
rubyで三項演算子
ruby
user.admin? ? "I appreciate for that." : "Thanks"
```
```
SNSでログイン
rails gem
gem "devise"
gem "omniauth-twitter"
deviseは必須じゃないかも？
```
```
N+1検出
rails gem
gem "bullet"
入れただけでは機能しないので、 config/development.rb に以下の追記が必要
  # enable bullet
  config.after_initialize do
    Bullet.enable = true
    Bullet.bullet_logger = true
    Bullet.rails_logger = true
  end
```
```
デバッガサポート
ruby rails gem
gem 'pry-rails'
gem 'pry-doc'
gem "pry-byebug"
pry-rails : railsコンソールをpryに変更（デフォルトはirb）
pry-doc   : pryのshow-methodコマンドで、C言語レイヤーのドキュメントも表示
pry-byebug: binding.pryでデバッグできるようになる
```
```
環境定義を.envファイルで管理
ruby rails gem
gem "dotenv-rails"
hog="fuga"で登録、
ENV["hoge"]でアクセスできる
```