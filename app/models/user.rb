class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         # ニックネームが必須（カスタムメッセージ追加）
         validates :nickname, presence: { message: 'を入力してください' }
         # パスワードは、半角英数字混合での入力が必須
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
         validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英字と数字の両方を含めて設定してください' }
         # お名前（全角）のバリデーション（名字と名前が必須、全角のみ許可）
         validates :last_name, :first_name, presence: { message: 'を入力してください' },
                   format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
         # お名前カナ（全角）のバリデーション（名字と名前が必須、全角カタカナのみ許可）
         validates :last_name_reading, :first_name_reading, presence: { message: 'を入力してください' },
                   format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角（カタカナ）で入力してください' }
         # 生年月日が必須（カスタムメッセージ追加）
         validates :birthday, presence: { message: 'を選択してください' }
end
