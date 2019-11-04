class TodolistsController < ApplicationController
  def new
  	@list = List.new
  end

  def create
  	#ストロングパロメーター使用
  	list = List.new(list_params)
  	#dbへ保存
  	list.save
    #しょうさい
  	redirect_to todolist_path(list.id)
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
  	  redirect_to todolist_path(list.id)
  end

  private

  def list_params
  	params.require(:list).permit(:title,:body)
  end
end
