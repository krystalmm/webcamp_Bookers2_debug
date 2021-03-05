class DailyMailer < ApplicationMailer
  def send_once_a_day(user)
    @user = user
    mail to: user.email, subject: '毎日のメール'
  end
end
