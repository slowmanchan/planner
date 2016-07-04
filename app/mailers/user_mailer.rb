class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url = 'https://www.google.ca'
    mail(to: @user.email, subject: 'Welcome to my amazeballs site!')
  end
end
