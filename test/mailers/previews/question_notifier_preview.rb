# Preview all emails at http://localhost:3000/rails/mailers/question_notifier
class QuestionNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/question_notifier/received
  def received
    QuestionNotifier.received
  end

end
