require 'spec_helper'

describe "roles/show.html.erb" do
  before(:each) do
    assign(:role, @role = stub_model(Role,
      :name => "MyString"
    ))
  end

  it "renders attributes in <p>" do
    render
    response.should contain("MyString")
  end
end
