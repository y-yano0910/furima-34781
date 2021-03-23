require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '商品の購入ができるとき' do
      it 'token, postal_code, prefecture_id, municipality, house_number, phone_numberが存在すれば保存できること' do
        expect(@order_shipping).to be_valid
      end

      it 'postal_codeは半角数字かつハイフンが入っていると保存ができること' do
        @order_shipping.postal_code = '123-4567'
        expect(@order_shipping).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @order_shipping.building_name = ''
        expect(@order_shipping).to be_valid
      end

      it 'phone_numberは11桁以内の数値であれば保存できること' do
        @order_shipping.phone_number = '09012345678'
        expect(@order_shipping).to be_valid
      end
    end

    context '商品の購入ができないとき' do
      it 'tokenがないと保存できないこと' do
        @order_shipping.token = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeがないと保存できないこと' do
        @order_shipping.postal_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeはハイフンが入っていないと保存できないこと' do
        @order_shipping.postal_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postal code Input correctly')
      end

      it 'postal_codeは半角英数字混合では保存ができないこと' do
        @order_shipping.postal_code = 'abc1234'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postal code Input correctly')
      end

      it 'postal_codeが半角英字では保存ができないこと' do
        @order_shipping.postal_code = 'abcdefg'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postal code Input correctly')
      end

      it 'postal_codeが全角文字では保存ができなこと' do
        @order_shipping.postal_code = '１２３−４５６７'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postal code Input correctly')
      end

      it 'prefecture_idがないと保存できないこと' do
        @order_shipping.prefecture_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idはid=1の---では保存できないこと' do
        @order_shipping.prefecture_id = 1
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Prefecture Select')
      end

      it 'municipalityがないと保存できないこと' do
        @order_shipping.municipality = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'house_numberがないと保存できないこと' do
        @order_shipping.house_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberがないと保存できないこと' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが数値以外では保存ができないこと' do
        @order_shipping.phone_number = 'abcabcdabcd'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number Input only number')
      end

      it 'phone_numberが12桁以上では保存ができないこと' do
        @order_shipping.phone_number = '090123456789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end

      it 'userが紐づいていないと保存ができないこと' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいていないと保存ができないこと' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
