json.array!(@voters) do |voter|
  json.extract! voter, :id, :username, :password
  json.url voter_url(voter, format: :json)
end
