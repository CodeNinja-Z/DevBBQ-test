class MessageMailer < ApplicationMailer
  #include SendGrid

  default from: 'carloszhao728@gmail.com',
          subject: 'An email sent via SendGrid with substitutions'
 
  def welcome_email(user)
    @user = user
    @url  = 'localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  # def email_with_substitutions
  #   substitute '-user_name-', %w(User1 User2)
  #   mail to: blacklight728@gmail.com, body: "Hello, -user_name-!"
  # end

end
