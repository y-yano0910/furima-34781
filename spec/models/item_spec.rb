require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品の出品ができる時' do
      it 'image, name, description, price, category_id, condition_id, shipping_charge_id, prefecture_id, shipping_day_idが存在すれば保存できること' do
        expect(@item).to be_valid
      end

      it 'priceは半角数字かつ¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = '9999999'
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない時' do
      it 'imageがないと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameがないと保存できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionがないと保存できないこと' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idがないと保存できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idがid=1の---では保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it 'condition_idがないと保存できないこと' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'condition_idがid=1の---では保存できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end

      it 'shipping_charge_idがないと保存できないこと' do
        @item.shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end

      it 'shipping_charge_idがid=1の---では保存できないこと' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge Select')
      end

      it 'prefecture_idがないと保存できないこと' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idがid=1の---では保存できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end

      it 'shipping_day_idがないと保存できないこと' do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it 'shipping_day_idがid=1の---では保存できないこと' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day Select')
      end

      it 'priceがないと保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが半角数字以外では保存できないこと' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'priceが¥300未満だと保存できないこと' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'pricceが¥9,999,999超過だと保存できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'userが紐づいていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
