json.array!(@questions) do |question|
  json.extract! question, :id, :body, :start, :end
  json.url question_url(question, format: :json)
end
