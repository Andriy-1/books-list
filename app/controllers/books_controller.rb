class BooksController < ApplicationController
	before_action :set_book, only: %i[show edit update destroy]
	# GET /books
	def index
	  # Отримання всіх контактів з бази даних
	  @books = Book.all
	end
	# GET /books/:id
	def show
	  # Знаходження контакту за ідентифікатором з параметрів запиту
	  @book = Book.find(params[:id])
	end
	# GET /books/new
	def new
	  @book = Book.new
	end
	# POST /books
	def create
	  # Створення нового контакту з параметрів форми
	  @book = Book.new(book_params)
	  if @book.save
		# Редірект на головну сторінку з повідомленням про успішне створення
		redirect_to root_path, notice: 'Контакт успішно створено.'
	  else
		# Відображення форми створення з повідомленням про помилку
		render :new
	  end
	end
	# GET /books/:id/edit
	def edit
	end
	# PATCH /books/:id
	def update
	  # Оновлення контакту з параметрів форми
	  if @book.update(book_params)
		# Редірект на головну сторінку з повідомленням про успішне оновлення
		redirect_to root_path, notice: 'Контакт успішно оновлено.'
	  else
		render :edit
	  end
	end
	# DELETE /books/:id
	def destroy
	  # Видалення контакту за ідентифікатором з параметрів запиту
	  @book = Book.find(params[:id])
	  @Book.destroy
	  redirect_to books_url, notice: 'Контакт успішно видалено.'
	end
	private
	# Встановлення контакту за ідентифікатором
	def set_book
	  @book = Book.find(params[:id])
	end
	# Дозволені параметри для масиву strong parameters
	def book_params
	  params.require(:book).permit(:title, :author, :description)
	end
  end
  