# frozen_string_literal: true

module Admins
  class AuthController < ApiGuard::AuthenticationController
    before_action :find_resource, only: [:create]

    def create
      if resource.authenticate(params[:password])
        create_token_and_set_header(resource, resource_name)
        render_success(data: resource)
      else
        raise Unauthorized, 'Invalid admin credentials'
      end
    end

    def destroy
      super
    end

    private

    def find_resource
      self.resource = Admin.find_by(email: params[:email])
      raise Unauthorized, 'Invalid admin credentials' unless resource
    end
  end
end
