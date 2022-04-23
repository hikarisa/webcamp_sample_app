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
    # 詳細画面へリダイレクト
    redirect_to list_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
