class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:email, :password, :password_confirmation, :remember_me, :gender, :occupation, :profile_picture,
                                             { address_attributes: %i[country city zip_code] }])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [:email, :password, :password_confirmation, :current_password, :gender, :occupation, :profile_picture,
                                             { address_attributes: %i[country city zip_code] }])
  end
end
