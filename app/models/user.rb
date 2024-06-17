class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :doctor
  has_one :receptionists
  has_one_attached :profile_pic

  enum role: { receptionist: "receptionist", doctor: "doctor" }

  validates :last_name, :first_name, :email, :password, :role, presence: true
  validates :phone, :gender, :middle_name, presence: true, allow_nil: true
  validates :email, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :password, length: {minimum: 5}
  validates :phone, length: {minimum: 11, maximum: 15}, format: {with: /\A[+-]?\d+\z/}, allow_nil: true

  def doctor?
    role == 'doctor'
  end

  def receptionist?
    role == 'receptionist'
  end
end
