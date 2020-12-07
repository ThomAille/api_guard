# frozen_string_literal: true

module ApiGuard
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from ApiGuard::Unauthorized do |e|
          respond(:unauthorized, 401, e.to_s)
        end
        rescue_from ApiGuard::UnprocessableEntity do |e|
          respond(:unprocessable_entity, 422, e.to_s)
        end
      end
    end

    private

    def respond(_error, _status, _message)

      data = { status: I18n.t('api_guard.response.error') }
      data[:error] = _message

      render json: data, status: _status
    end
  end
end