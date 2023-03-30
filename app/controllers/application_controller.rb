class ApplicationController < ActionController::Base
  before_action :basic_auth


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end
end
#export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
#export PATH="/usr/local/opt/node@14/bin:$PATH"