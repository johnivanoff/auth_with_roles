Given /^I am logged in as "([^"]*)" with password "([^"]*)" with role "([^"]*)"$/ do |arg1, arg2, arg3|
  Role.create!(:name => arg3)
  visit new_user_path
  fill_in("Username", :with => arg1)
  fill_in("Email", :with => "x@x.com")
  fill_in("Password", :with => arg2)
  fill_in("Password confirmation", :with => arg2)
  check("admin")
  click_button("Create")
end


Given /^the following roles:$/ do |roles|
  Role.create!(roles.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) role$/ do |pos|
  visit roles_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following roles:$/ do |expected_roles_table|
  expected_roles_table.diff!(tableish('table tr', 'td,th'))
end
