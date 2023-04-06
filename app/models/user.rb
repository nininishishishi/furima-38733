class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

         validates :password, length: { in: 6..129 }, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'}
         validates :nickname, presence: true
         validates :lastname, presence: true
         validates :firstname, presence: true
         validates :lastname_kana, presence: true
         validates :firstname_kana, presence: true
         validates :birthday, presence: true
end
