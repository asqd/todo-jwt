module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError
  end
  class MissingToken < StandardError
  end
  class InvalidToken < StandardError
  end
  class ExpiredSignature < StandardError
  end

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two
    rescue_from ExceptionHandler::ExpiredSignature, with: :four_twenty_two

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

  end

  private
  # JSON response with message and 422 status code
  def four_twenty_two(e)
    json_response({ message: e.message }, :unprocessable_entity)
  end

  # JSON response with message and 401 status code
  def unauthorized_request(e)
    json_response({ message: e.message }, :unauthorized)
  end
end