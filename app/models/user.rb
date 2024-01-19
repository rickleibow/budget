class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :operations, foreign_key: 'author_id', dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :name, presence: true

  def admin?
    role == 'admin'
  end
end