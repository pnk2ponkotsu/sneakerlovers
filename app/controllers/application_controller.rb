class ApplicationController < ActionController::Base

  def after_sign_in_path
    case resource
      when Admin
        root_path
      when User
        users_path
    end
  end

  def after_sign_out_path
    case resource
      when Admin
        new_user_session_path
      when User
        new_user_session_path
    end
  end

end
