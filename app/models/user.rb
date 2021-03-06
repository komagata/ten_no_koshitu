class User < ApplicationRecord
  include TenhouAccountsHelper
  belongs_to :team, optional: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  validates :name, presence: true, uniqueness: true

  # deviseのメソッドをオーバーライドして、パスワード無しでユーザー情報を編集できるようにする
  def update_with_password(params)
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
    result = update(params)
    clean_up_passwords
    result
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
