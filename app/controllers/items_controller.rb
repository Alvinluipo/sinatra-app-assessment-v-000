class ItemsController < ApplicationController

   get "/items" do
    redirect_if_not_logged_in
    @items = Item.all
    erb :'items/index'
  end

  get "/items/new" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'items/new'
  end

  get '/items/:id/edit' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @item = Item.find(params[:id])
    erb :'items/edit'
  end

  post '/items/:id' do
    redirect_if_not_logged_in
    @item =Item.find(params[:id])
    unless Item.valid_params?(params)
      redirect "/items/#{@item.id}/edit?error=invalid item"
    end
    @item.update(params.select{|a|a=="name" || a=="capacity"})
    redirect "/items/#{@item.id}"
  end

  get '/items/:id' do
    redirect_if_not_logged_in
    @item = Item.find(params[:id])
    erb :'items/show'
  end

  post "/items" do
    redirect_if_not_logged_in

    unless Item.valid_params?(params)
      redirect "/items/new?error=invalid item"
    end
    Item.create(params)
    redirect "/items"
  end

  post '/items/:id/delete' do
      @item = Item.find_by_id(params[:id])
      @item.delete
      redirect "/items"
     
  end
end