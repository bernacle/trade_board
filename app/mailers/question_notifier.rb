class QuestionNotifier < ApplicationMailer
  default from: 'Admin <tradeboard@example.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.question_notifier.received.subject
  #
  def received(offer, question)
    @offer = offer
    @question = question

    mail to: offer.user.email, subject: 'A question has been made, Go check it out'
  end
end
