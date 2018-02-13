json.extract! note, :id, :body, :note_type, :user_id, :horse_id, :created_at, :updated_at
json.url note_url(note, format: :json)
