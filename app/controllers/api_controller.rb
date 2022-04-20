class ApiController < ApplicationController
  before_action :check_user, except: %i[createUser login]

  def createUser
    if params[:name].blank?
      render json: { message: "Nome precisa estar presente" }, status: 400
      return
    end
    if params[:email].blank?
      render json: { message: "Email precisa estar presente"  }, status: 400
      return
    end
    if params[:password].blank?
      render json: { message: "Senha precisa estar presente" }, status: 400
      return
    end

    u = User.new
    u.name = params[:name]
    u.email = params[:email]
    u.password = params[:password]

    if u.save
      render json: { message: "Usuario criado. Faça o login" }, status: 200
    else
      render json: { message: "Tente Novamente" }, status: 400
    end
  end

  def login
    if params[:email].blank?
      render json: { message: "Email precisa estar presente"  }, status: 400
      return
    end
    if params[:password].blank?
      render json: { message: "Senha precisa estar presente" }, status: 400
      return
    end

    user = User.where(email: params[:email]).first
  
    if user.password == params[:password]
      sign_in user
      render json: { message: "Bem vindo" }
    else
      render json: { message: "Senha Incorreta" }, status: 400
    end
  end

  def check_user
    if current_user.nil?
      render json: { message: "Faça o login" }, status: 400
    end
  end

  def sign_out
    signOut
    render json: { message: "Faça o login" }, status: 400
  end
end