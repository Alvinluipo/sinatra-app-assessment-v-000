class ItemController < ApplicationController

   get "/item" do
    redirect_if_not_logged_in
    @items = Item.all
    erb :'item/index'
  end

  get '/item/new' do
    redirect_if_not_logged_in
    erb :'item/new'
  end

  post "/item/new" do
    redirect_if_not_logged_in
    Item.create(params)
    redirect "/shop"
    redirect "/item"
  end

  get '/item/:id' do
    redirect_if_not_logged_in
    redirect_if_wrong_user
    @position = Position.find_by_id(params[:id])
    erb :'item/show'
  end

  get '/item/:id/edit' do
    redirect_if_not_logged_in
    redirect_if_wrong_user
    @item = Item.find_by_id(params[:id])
    erb :'item/edit'
  end

  post '/item/:id' do
    redirect_if_not_logged_in
    redirect_if_wrong_user
    @item = Item.find_by_id(params[:id])
    @Item.name = params[:name]
    @item.category = params[:category]
    @item.user_id = session[:user_id]
    @item.save
    redirect '/item/:id'
  end

  def redirect_if_wrong_user
    if current_user.id != @item.id
      redirect "/login?error=Those aren't your items"
    end
  end


end