class DailyMailer < ApplicationMailer
  def send_once_a_day
    user_email = User.pluck(:email)
    mail to: user_email, subject: "everyday Bookers"
  end
end
