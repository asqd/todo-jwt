class JsonWebToken
  SECRET = Rails.application.secrets.secret_key_base
  EXPIRES_IN = 24.hours.from_now

  def self.encode(payload, exp = EXPIRES_IN)
    payload[:exp] = exp.to_i

    JWT.encode(payload, SECRET)
  end

  def self.decode(token)
    body = JWT.decode(token, SECRET).first
    HashWithIndifferentAccess.new body

  rescue JWT::ExpiredSignature, JWT::VerificationError => e
    raise ExceptionHandler::ExpiredSignature, e.message
  end
end