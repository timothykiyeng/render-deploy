class ApplicationController < ActionController::Base
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  include ActionController::Helpers
    include Response
    helper_method :current_user

    def current_user #We use this action to monitor who is logged in based on the session
      if session[:author_id]
          @current_user = User.find(session[:user_id])
      end
  end


  private

  def authorize
    if !current_user
      json_response({message:'You are not authorized to perform this action. You have to log in'}, status = 401)
    end
end


  def render_unprocessable_entity(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end
end
