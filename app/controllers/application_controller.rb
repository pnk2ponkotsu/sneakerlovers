class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  

  def after_sign_in_path_for(resource)
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
        root_path
      when User
        root_path
    end
  end

end
