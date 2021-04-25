require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の保存' do
    context '商品が登録できる場合' do
      it '商品名、商品説明、商品画像、カテゴリ、状態、配送料、発送元、発送までの日数、価格の入力があれば投稿できる' do
      end
    end
    context '商品が登録できない場合' do
      it '商品名が空では投稿できない' do
      end     
    end
  end
end
