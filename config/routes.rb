Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #HTTPリクエスト名 'URLのディレクトリ部分' => 'コントローラー名#そのアクション'
  get 'top' => 'homes#top'

  get 'todolists/new'
  post 'todolists' => 'todolists#create'
  get 'todolists' => 'todolists#index'
  # .../todolists/1 や .../todolists/3 に該当する
  #as: '名前' は「名前付きルート」
  get 'todolists/:id' => 'todolists#show', as: 'todolist'
  get 'todolists/:id/edit' => 'todolists#edit', as: 'edit_todolist'
  #更新の場合はpatchメソッドを利用する.
  patch 'todolists/:id' => 'todolists#update', as: 'update_todolist'
  delete 'todolists/:id' => 'todolists#destroy', as: 'destroy_todolist'
end
