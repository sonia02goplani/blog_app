class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
     helper_method :date_format
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
    posts_path
  end
   def after_sign_out_path_for(resource_or_scope)
 respond_to?(:root_path) ? root_path : "/"
end
                                   
end
