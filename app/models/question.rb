class Question < ActiveRecord::Base
  has_many :vote_record

  def self.open
    now = Time.now
    Question.where('start <= ? and end >= ?', now, now)
  end

  def self.open_questions_for(voter_id)
    open = self.open
    if (votes_for_user = VoteRecord.where('voter_id = ?', voter_id))
      done = Set.new
      votes_for_user.each { |v| done << v.question_id }
      open.to_a.delete_if { |q| done.include? q.id }
    end
    open
  end
end
