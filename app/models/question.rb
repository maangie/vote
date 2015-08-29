class Question < ActiveRecord::Base
  has_many :vote_record

  def self.open_questions_for(voter_id)
    now = Time.now
    open = Question.where('start <= ? and end >= ?', now, now)
    if (votes_for_user = VoteRecord.where('voter_id = ?', voter_id))
      done = Set.new
      votes_for_user.each { |v| done << v.question_id }
      open.to_a.delete_if { |q| done.include? q.id }
    end
    open
  end
end
