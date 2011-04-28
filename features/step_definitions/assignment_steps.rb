Given /^the following assignments:$/ do |assignments|
  Assignment.create!(assignments.hashes)
end