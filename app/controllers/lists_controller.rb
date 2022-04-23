class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数にからのModelオブジェクトを生成する。
    @list = List.new
  end
  
  def create
    # データの受け取りと新規登録
    list = List.new(list_params)
    # データベースに保存
    list.save
    # トップ画面へリダイレクト
    redirect_to '/top'
  end

  def index
  end

  def show
  end

  def edit
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
