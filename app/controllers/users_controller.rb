class UsersController < Devise::RegistrationsController
  layout 'dashboard', only: [:edit, :update]
  before_action -> { set_active_menu_item "account" }, only: [:edit, :update]


end
