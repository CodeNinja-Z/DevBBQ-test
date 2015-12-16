ActionMailer::Base.register_interceptor(SendGrid::MailInterceptor)

# For development:
# ActionMailer::Base.smtp_settings = {
#   :address => 'smtp.sendgrid.net',
#   :port => '2525',
#   :domain => 'example.com',
#   :authentication => :plain,
#   :user_name => ENV['SENDGRID_USERNAME'],
#   :password => ENV['SENDGRID_PASSWORD']
# }

# For using Heroku:
if ENV['SENDGRID_USERNAME'] && ENV['SENDGRID_PASSWORD']
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '465',
    :authentication => :plain,
    :user_name      => ENV['SENDGRID_USERNAME'],
    :password       => ENV['SENDGRID_PASSWORD'],
    :domain         => 'devbbq-test.herokuapp.com',
    :enable_starttls_auto => true,
    :ssl => true
  }
  ActionMailer::Base.delivery_method = :smtp
end

SendGrid.configure do |config|
  config.dummy_recipient = 'careers@devbbq.com'
end