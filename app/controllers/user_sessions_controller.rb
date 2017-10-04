class UserSessionsController < ApplicationController

  def signup
    user = User.new(permit_params)
    if user.save
      render json: {message: "successfully created", status: :ok }
    else
      render json: {message: user.errors.full_messages}
    end

  end


  def login
    login_hash = permit_login
    user = User.where(email: permit_login[:email])
    if user.count ==0
      render json: {message:"invalid email"}
    else
      user = user.first
      if user.authenticate(permit_login[:password])
        session = Session.new(user_id: user.id)
        session.save
        render json: {authentication_token: session.authentication_token, status: 200}
      else
        render json: {message: "Invalid Password", status: 403}
      end
    end
  end



  def signout

  end


  def permit_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def permit_login
    params.permit(:email,:password)
  end


  def signout_params
    params.permit()
  end


end
