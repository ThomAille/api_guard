# frozen_string_literal: true

module ApiGuard
  class Unauthorized < StandardError; end
  class UnprocessableEntity < StandardError; end
end