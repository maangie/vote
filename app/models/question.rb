class Question < ActiveRecord::Base
  has_many :vote_record
end
