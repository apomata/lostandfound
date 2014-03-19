json.array!(@items) do |item|
  json.extract! item, :id, :title, :description, :category, :owner
  json.url item_url(item, format: :json)
end
