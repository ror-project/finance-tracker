json.array!(@expense_trackers) do |expense_tracker|
  json.extract! expense_tracker, :id, :year, :month, :income, :grocery, :mortgage, :gas, :shopping, :restaurant, :utilities, :other, :notes
  json.url expense_tracker_url(expense_tracker, format: :json)
end
