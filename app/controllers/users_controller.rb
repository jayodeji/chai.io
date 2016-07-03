# class UsersController < DashboardController
class UsersController < Devise::RegistrationsController
  layout 'dashboard', only: [:edit, :update]
  before_action -> { set_active_menu_item "account" }, only: [:edit, :update]

  # GET /users/:id/edit
  # def edit
  #   set_active_menu_item 'account'
  #   @user = current_user
  # end

  # def update
  #   @user = User.find(current_user.id)
  #   update_params = devise_parameter_sanitizer.sanitize(:user)
  #   byebug
  # end

  # def update
  #   self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
  #   prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

  #   resource_updated = update_resource(resource, account_update_params)
  #   yield resource if block_given?
  #   if resource_updated
  #     if is_flashing_format?
  #       flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
  #         :update_needs_confirmation : :updated
  #       set_flash_message :notice, flash_key
  #     end
  #     sign_in resource_name, resource, bypass: true
  #     respond_with resource, location: after_update_path_for(resource)
  #   else
  #     clean_up_passwords resource
  #     respond_with resource
  #   end
  # end
  # def update
  #   @user = User.find(current_user.id)
  #   update_params = account_update_params
  #   # user_updated = @user.update_with_password(account_update_params)
  #   # if user_updated
  #   #   flash[:notice] = "Account updated!!"
  #   # else
  #   #   clean_up_passwords @user
  #   # end
  #   redirect_to edit_user_path(current_user)
  # end

  #PUT /users/:id
   # def update
   #  current_password = params[:user][:password]
   #  new_password = params[:user][:new_password]
   #  new_password_confirm = params[:user][:new_password_confirm]
   #  flash.now[:error] = "Invalid Password!" unless current_user.authenticate(current_password)
   #  flash.now[:error] = "Passwords do not match!" unless new_password == new_password_confirm
   #  if flash.now[:error]
   #   redirect_to edit_user_path(current_user)
   #   return
   #  end
   #  current_user.password = new_password
   #  current_user.password_confirmation = new_password
   #  if current_user.save
   #    flash[:notice] = "Password changed!!"
   #  end
   #  redirect_to edit_user_path(current_user)
   # end

   # PUT /users/:id


  # def account_update_params
  #   byebug
  #   devise_parameter_sanitizer.sanitize(:user)
  # end

   # def update_password
   #  @user = User.find(current_user.id)
   #  params = password_change_params
   #  if @user.update(params)
   #  end
   # end
end


# class UsersController < ApplicationController

#   before_action :authenticate_user!

#   def edit
#     @user = current_user
#   end

#   def update_password
#     @user = User.find(current_user.id)
#     if @user.update(user_params)
#       # Sign in the user by passing validation in case their password changed
#       sign_in @user, :bypass => true
#       redirect_to root_path
#     else
#       render "edit"
#     end
#   end

#   private

#   def user_params
#     # NOTE: Using `strong_parameters` gem
#     params.require(:user).permit(:password, :password_confirmation)
#   end
# end
