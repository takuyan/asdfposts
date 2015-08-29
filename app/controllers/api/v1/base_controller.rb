class Api::V1::BaseController < ActionController::API
  respond_to :json
  before_action :doorkeeper_authorize!

  private

  def current_user
    if params['user_id']
      @current_user ||= User.find_by id: params['user_id']
    else
      nil
    end
  end
end
