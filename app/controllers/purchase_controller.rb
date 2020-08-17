class PurchaseController < ApplicationController
  
  require 'payjp'

  def index
    @production = Production.find(params[:production_id]) 

    card = Card.where(user_id: current_user.id).first
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @card = customer.cards.retrieve(card.card_id)
    end
  end

  def pay

    @production = Production.find(params[:production_id])
      card = Card.where(user_id: current_user.id).first
      Payjp.api_key = ENV['PAYJP_ACCESS_KEY']
      Payjp::Charge.create(
      :amount => @production.price, #支払金額を入力（itemテーブル等に紐づけても良い）
      :customer => card.customer_id, #顧客ID
      :currency => 'jpy', #日本円
    )
    @production.update(purchaser_id: current_user.id)
    redirect_to root_path
    flash[:sucess] = "購入が完了しました"
  end



end
