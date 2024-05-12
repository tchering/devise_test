# Preview all emails at http://localhost:3000/rails/mailers/devise/mailer
class Devise::MailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/devise/mailer/confirmation_instructions
  def confirmation_instructions
    user = User.last
    Devise::Mailer.confirmation_instructions(user, user.confirmation_token, {})
  end

  # Preview this email at http://localhost:3000/rails/mailers/devise/mailer/reset_password_instructions
  def reset_password_instructions
    user = User.last
    Devise::Mailer.reset_password_instructions(user, user.reset_password_token, {})
  end

  # Preview this email at http://localhost:3000/rails/mailers/devise/mailer/unlock_instructions
  def unlock_instructions
    user = User.last
    Devise::Mailer.unlock_instructions(user, user.unlock_token, {})
  end
end
