class Memo < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 255 }
  
  def self.looks(word)
      Memo.where("title LIKE ?","%#{word}%")
  end
end
