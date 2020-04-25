class TodolistsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    #@は対象拡張子と呼ばれスコープを拡大する.@がついているものはインスタンス変数と呼ばれる.
    @list = List.new
  end

  def create
    # ストロングパラメーターを使用
     list = List.new(list_params)
    # DBへ保存する
     list.save
    # 詳細画面にリダイレクト
    redirect_to todolist_path(list.id)
  end

  def index
    #新しくlistsインスタンスを作成する(配列)
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    #listを適宜更新する
    list = List.find(params[:id]) #インスタンス
    list.update(list_params) #DB
    redirect_to todolist_path(list.id)
  end

  def destroy
    list = List.find(params[:id]) #データ(レコード)を1件取得
    list.destroy #データ（レコード）を削除
    redirect_to todolists_path #List一覧画面へリダイレクト
  end

  private
  #publicなメソッドを定義してしまうとアクションと認識されてしまう
  #privateなメソッドの命名規則として,モデル名_paramsとされることが多い.
  def list_params
      #paramsって何
      #requireでオブジェクト指定
      #permitでformで指定されているオブジェクトを指定
      #ListってEntityが定義されていないけども…これでいけるのか.
      params.require(:list).permit(:title, :body, :image)
  end
end
