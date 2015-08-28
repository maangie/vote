class VoteRecord < ActiveRecord::Base
  belongs_to :voter
  belongs_to :question
end
