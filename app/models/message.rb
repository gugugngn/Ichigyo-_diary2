class Message < ApplicationRecord
  belongs_to :message_text
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
  
  validate :one_message_to_user
  
  # メッセージの送信を1ユーザーにつき1日1回までに制限
  def one_message_to_user
    if Message.where(sender_id: sender_id, receiver_id: receiver_id, created_at: Time.zone.today.all_day).exists?
      errors.add(:base, "小さなエールは１ユーザーにつき1日1回までです")
    end
  end
  
end