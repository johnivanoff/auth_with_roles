require 'spec_helper'

describe "roles/index.html.erb" do
  before(:each) do
    assign(:roles, [
      stub_model(Role,
        :name => "MyString"
      ),
      stub_model(Role,
        :name => "MyString"
      )
    ])
  end

  it "renders a list of roles" do
    render
    response.should have_selector("tr>td", :content => "MyString".to_s, :count => 2)
  end
end
