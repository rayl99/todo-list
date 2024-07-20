class ApplicationController < ActionController::Base
  include RenderHelper
  
  rescue_from StandardError, with: :render_error

  def render_error(exception)
    render json: { error: exception.message }, status: :internal_server_error
  end
end
