class Contact < ApplicationRecord
	validates :name, presence: { message: "Введіть ім'я" }, length: { maximum: 255, message: "Максимальна довжина - 255 символів" }
	validates :phone, presence: { message: "Введіть номер телефону" }, length: { maximum: 20, message: "Максимальна довжина - 20 символів" }
	validates :email, presence: { message: "Введіть електронну пошту" }, length: { maximum: 255, message: "Максимальна довжина - 255 символів" },
					  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Некоректний формат електронної пошти" }
  
  end
  