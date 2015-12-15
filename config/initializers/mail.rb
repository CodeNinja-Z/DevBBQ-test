ActionMailer::Base.register_interceptor(SendGrid::MailInterceptor)

ActionMailer::Base.smtp_settings = {
  :address => 'smtp.sendgrid.net',
  :port => '2525',
  :domain => 'example.com',
  :authentication => :plain,
  :user_name => 'CarlosZhao',
  :password => 'woshixiaozhi890728'
}

# For using Heroku:
# if ENV['SENDGRID_USERNAME'] && ENV['SENDGRID_PASSWORD']
#   ActionMailer::Base.smtp_settings = {
#     :address        => 'smtp.sendgrid.net',
#     :port           => '465',
#     :authentication => :plain,
#     :user_name      => ENV['SENDGRID_USERNAME'],
#     :password       => ENV['SENDGRID_PASSWORD'],
#     :domain         => 'heroku.com',
#     :enable_starttls_auto => true,
#     :ssl => true
#   }
#   ActionMailer::Base.delivery_method = :smtp
# end

SendGrid.configure do |config|
  config.dummy_recipient = 'blacklight728@gmail.com'
end