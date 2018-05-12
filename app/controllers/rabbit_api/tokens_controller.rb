require_dependency 'rabbit_api/application_controller'

module RabbitApi
  class TokensController < ApplicationController
    before_action :authenticate_resource, only: [:create]
    before_action :find_refresh_token, only: [:create]

    def create
      @refresh_token.destroy
      create_token_and_set_header # Create JWT token and refresh token
      render_success(data: resource)
    end

    private

    def find_refresh_token
      refresh_token_from_header = request.headers['Refresh-Token']

      if refresh_token_from_header
        @refresh_token = resource.refresh_tokens.find_by_token(refresh_token_from_header)
        return render_error(401, message: 'Invalid refresh token') unless @refresh_token
      else
        render_error(401, message: 'Refresh token is missing in the request')
      end
    end
  end
end