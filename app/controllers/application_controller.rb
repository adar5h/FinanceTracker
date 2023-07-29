class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    def send_email
        recipient_email = "iadarshh@gmail.com"
        subject = "Bug for FinanceTracker"
        redirect_to "mailto:#{recipient_email}?subject=#{URI.encode(subject)}"
      end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end
end
