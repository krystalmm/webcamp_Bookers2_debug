class ThanksMailer < ApplicationMailer
  def send_when_signup(user)
    @user = user
    mail to: user.email, subject:  '会員登録が完了しました。'
  end
end
