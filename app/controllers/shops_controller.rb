class ShopsController < ApplicationController

  get '/shops' do
    redirect_if_not_logged_in
    @shops = Shop.all
    erb :'shops/index'
  end

  get '/shops/new' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'shops/new'
  end

  get "/shops/:id/edit" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @shop = Shop.find(params[:id])
    erb :'shops/edit'
  end

  post '/shops/:id' do
    redirect_if_not_logged_in
    @shop = Shop.find(params[:id])
    unless Shop.valid_params?(params)
      redirect "/shops/#{@shop.id}/edit?error=invalid shop"
    end
    @shop.update(params.select{|a|a=="name" || a=="category" || a=="item_id"})
    redirect "/shops/#{@shop.id}"
  end

  get '/shops/:id' do
    redirect_if_not_logged_in
    @shop = current_user.shops.find(params[:id])
    erb :'shops/show'

  end

 post "/shops" do
    redirect_if_not_logged_in 
    unless Shop.valid_params?(params)
      redirect "/shops/new?error=invalid shop"
    end
    Shop.create(params)
    redirect "/shops"
  end
end