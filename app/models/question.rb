class Question < ActiveRecord::Base
  has_many :vote_record

  def self.open
    now = Time.now
    Question.where('start <= ? and end >= ?', now, now)
  end
end
