class ExternalApisController < ApplicationController

  def validate_authenticity
    session = Session.where(authentication_token:permit_params[:authentication_token])
    if session.count ==0
      render json: {message:"Invalid", status:403}
    else
      s = session.first
      if s.expiry_at <= Time.current
        render json: {message:"Expired",status: 403}
      else
        render json: {message: "valid", status: 200}
      end
    end

  end



  def permit_params
    params.permit(:user_id, :authentication_token)
  end


end