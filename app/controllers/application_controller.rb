class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?




  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :lastname, :firstname, :lastname_kana, :firstname_kana, :birthday])
  end


  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end
end
#export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
#export PATH="/usr/local/opt/node@14/bin:$PATH"