class TodolistsController < ApplicationController
  def new
  	@list = List.new
  end

  def create
  	#ストロングパロメーター使用
  	list = List.new(list_params)
  	#dbへ保存
  	list.save
    #トップ画面へリダイレクト
  	redirect_to '/top'
  end
  private

  def list_params
  	params.require(:list).permit(:title,:body)
  end
end
