class SessionsController < Devise::SessionsController

  # TODO add this to routes.rb
  def after_sign_in_path_for(resource)
    projects_path
  end

end
