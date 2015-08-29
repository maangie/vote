class VoteController < ApplicationController
  def list
    @uname = params[:username]
    pword  = params[:pword]
    voter_entry = @uname && Voter.find_by_username(@uname)
    if voter_entry == nil || voter_entry.password != pword
      # should post an error here
      render :action => 'index'  # redisplay login form
    else
      @questions = Question.open
    end
  end

  def record_votes
    uname = params[:username]
    unless (voter = Voter.find_by_username(uname))
      flash[:login_error] =
        "User id #{uname} no longer valid - please log back in."

      render action: 'index'
      return
    end

    VoteRecord.record_votes params[:question], voter
  end
end
