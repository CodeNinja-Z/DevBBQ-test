class MessageMailer < ApplicationMailer
  default from: 'carloszhao728@gmail.com',
          subject: 'An email sent via SendGrid' # default subject
 
  def welcome_email(user)
    @user = user
    @user_name = @user.email.split("@")[0]
    @url  = 'https://devbbq-test.herokuapp.com'
    mail(to: @user.email, subject: 'An email sent via SendGrid')
  end
end
