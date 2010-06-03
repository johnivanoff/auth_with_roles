require 'spec_helper'

describe Role do
  before(:each) do
    @role = Role.new(:name => "Jimmy")
  end
  
  it "is valid with valid attributes" do
    @role.should be_valid
  end
  
  it "is not valid without a name" do
    @role.name = nil
    @role.should_not be_valid
  end
  
  it "is not valid without a unique name" do
    @role2 = Role.create( :name => "Jimmy")
    @role.should_not be_valid
  end
  
end
