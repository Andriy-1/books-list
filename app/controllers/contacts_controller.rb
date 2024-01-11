class ContactsController < ApplicationController
	before_action :set_contact, only: %i[show edit update destroy]
	# GET /contacts
	def index
	  # Отримання всіх контактів з бази даних
	  @contacts = Contact.all
	end
	# GET /contacts/:id
	def show
	  # Знаходження контакту за ідентифікатором з параметрів запиту
	  @contact = Contact.find(params[:id])
	end
	# GET /contacts/new
	def new
	  @contact = Contact.new
	end
	# POST /contacts
	def create
	  # Створення нового контакту з параметрів форми
	  @contact = Contact.new(contact_params)
	  if @contact.save
		# Редірект на головну сторінку з повідомленням про успішне створення
		redirect_to root_path, notice: 'Контакт успішно створено.'
	  else
		# Відображення форми створення з повідомленням про помилку
		render :new
	  end
	end
	# GET /contacts/:id/edit
	def edit
	end
	# PATCH /contacts/:id
	def update
	  # Оновлення контакту з параметрів форми
	  if @contact.update(contact_params)
		# Редірект на головну сторінку з повідомленням про успішне оновлення
		redirect_to root_path, notice: 'Контакт успішно оновлено.'
	  else
		render :edit
	  end
	end
	# DELETE /contacts/:id
	def destroy
	  # Видалення контакту за ідентифікатором з параметрів запиту
	  @contact = Contact.find(params[:id])
	  @contact.destroy
	  redirect_to contacts_url, notice: 'Контакт успішно видалено.'
	end
	private
	# Встановлення контакту за ідентифікатором
	def set_contact
	  @contact = Contact.find(params[:id])
	end
	# Дозволені параметри для масиву strong parameters
	def contact_params
	  params.require(:contact).permit(:name, :phone, :email)
	end
  end
  