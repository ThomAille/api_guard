# frozen_string_literal: true

module ApiGuard
  module ResponseFormatters
    module Renderer
      def render_success(data: nil, message: nil)
        resp_data = { status: I18n.t('api_guard.response.success') }
        resp_data[:message] = message if message
        resp_data[:data] = data if data

        render json: resp_data, status: 200
      end
    end
  end
end
