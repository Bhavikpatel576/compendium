Clearance.configure do |config|
  #will prevent the usage of clearance routes
  config.allow_sign_up = true
  config.routes = false
  config.mailer_sender = "reply@example.com"
  config.rotate_csrf_on_sign_in = true
end
