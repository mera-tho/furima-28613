require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    
    it "名前, カナ名, 誕生日, ニックネーム, email, パスワード
    が存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "パスワード6文字未満はNG" do
      user = build(:user, password: "11111", password_confirmation: "11111")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    it "確認用パスワードが間違っている" do
      user = build(:user, password: "111111", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    #Not Null 制約のテスト↓

    it "last_nameがない場合は登録できないこと" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "last_name_kanaがない場合は登録できないこと" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "nikcnameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "birthdayがない場合は登録できないこと" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

  end
end 
