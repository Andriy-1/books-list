class Book < ApplicationRecord
	validates :title, presence: { message: "Введіть заголовок" }
	validates :author, presence: { message: "Введіть автора" }
	validates :description, presence: { message: "Введіть опис" }
  end
  