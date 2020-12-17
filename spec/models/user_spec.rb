require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "name,email、password,password_confirmation,nickname,last_name,first_name,last_name_kana,first_name_kana,birthdayが存在すれば登録できること" do
        expect(@user).to be_valid
      end
    end 
     context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
       it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "emailに＠含まれないと登録できない" do
      @user.email = "abcde"
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "last_nameが空だと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'last_nameが全角でないと登録できない' do
      @user.last_name = "suzuki"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
      end
      it "first_nameが空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_nameが全角でないと登録できない' do
      @user.first_name = "takashi"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it "last_name_kanaが空だと登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it "last_name_kanaが全角でないと登録できない" do
      @user.last_name_kana = "suzuki"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end
      it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it "first_name_kanaが全角でないと登録できない" do
      @user.first_name_kana = "takasi"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
      end
      it "birthdayが空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it 'password:半角英数混合になってないと登録できない' do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordが英字のみでは登録できない' do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordが数字のみでは登録できない' do
      @user.password = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordが全角では登録できない' do
      @user.password = "１５９２ａｂ"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "passwordが存在してもpassword_confirmationがない場合は登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
     end
  end
 end
end 



