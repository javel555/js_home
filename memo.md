# どんなサイトにするかメモ

## コンセプト
- あんぐらーJS試してみる
- じゃべめもを中心に据える
- じゃべめも棚卸を残したい
- ツイートの引用
- 一言コメント
- タグ付け
- などなどがスマホで出来る方法

## 機能一覧
### トップページ
- トップページ `GET / Home#index`
- ツイッターでログイン
### ユーザーページ
- スクラップしたツイート一覧 `GET /[username] Memo#index`
- タグ検索 `GET /[username]?search=[tag] Memo#index`
### 管理ページ
- 取り込み済ツイート一覧 `GET /edit/ Edit#index`
- 検索条件登録 `POST /edit/search Search#update`
- ツイート表示設定 `POST /edit/[id] Edit#update`
- タグ付け `POST /edit/tag/[id]`
- タグ解除 `DELETE /edit/tag/[id]`
- タグ一覧参照 `GET /edit/tag/ Tag#index`

## Gemとか
#### Common
- dotenv-rails
- devise
- omniauth-twitter
- slim-rails
- sass-rails
- acts-as-taggable-on
- kaminari
#### development
- rails_best_practices
- bullet
- pry-byebug
- pry-rails

## 回収する情報
- ID
- 発話者
- ツイート
- 

## rails routes

##### 子要素あり

- GET /hoge hoge#index
- GET /hoge/new hoge#new
- POST /hoge hoge#create
- GET /hoge/:id hoge#show
- GET /hoge/:id/edit hoge#edit
- PUT /hoge/:id hoge#update
- DELETE /hoge/:id hoge#destroy

##### 子要素なし

- GET /fuga/new fuga#new
- POST /fuga fuga#create
- GET /fuga fuga#show
- GET /fuga/edit fuga#edit
- PUT /fuga fuga#update
- DELETE /fuga fuga#destroy