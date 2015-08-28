json.array!(@vote_records) do |vote_record|
  json.extract! vote_record, :id, :voter_id, :question_id, :is_yes
  json.url vote_record_url(vote_record, format: :json)
end
