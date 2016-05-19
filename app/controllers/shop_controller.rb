class ShopController < ApplicationController

  get '/shop' do
    redirect_if_not_logged_in
    @shop = Shop.all
    erb :'shoppingcart/index'
  end

  get '/shop/new' do
    redirect_if_not_logged_in
    erb :'shop/new'
  end

  post '/shop/new' do
    redirect_if_not_logged_in
    Shop.create(params)
    redirect "/shop"
  end

  get '/shop/:id' do
    redirect_if_not_logged_in
    @shop = Shop.find_by_id(params[:id])
    erb :'shop/show'
  end

  get "/shop/:id/edit" do
    redirect_if_not_logged_in
    @shop = Shop.find_by_id(params[:id])
    erb :'shop/edit'
  end

  post '/shop/:id' do
    redirect_if_not_logged_in
    @shop = Shop.find_by_id(params[:id])
    @shop.name = params[:name]
    @shop.category = params[:category]
    @shop.save
    redirect "/shop/#{@shop.id}"
  end
end