require 'spec_helper'

describe Bicycle do

  before(:each) do
    @user = Factory(:user)
    @attr = {
      :avatar => "small_bike.jpg",
      :serial_number => "123-456-789-0",
      :make => "Cannondale",
      :model => "Capo",
      :color => "Black"}
  end

  it "should create a new instance given the correct attributes" do
    @user.bicycles.create!(@attr)
  end

  describe "user associations" do

    before(:each) do
      @bicycle = @user.bicycles.create(@attr)
    end

    it "should have a user attribute" do
      @bicycle.should respond_to(:user)
    end

    it "should have the right associated user" do
      @bicycle.user_id.should == @user.id
      @bicycle.user == @user
    end
  end

  describe "validations" do

    it "should require a user id" do
      Bicycle.new(@attr).should_not be_valid
    end

    it "should require nonblank serial number" do
      @user.bicycles.build(:serial_number => " ").should_not be_valid
    end

    it "should reject long serial numbers" do
      @user.bicycles.build(:serial_number => "c" * 101).should_not be_valid
    end

    it "should require nonblank model" do
      @user.bicycles.build(:model => " ").should_not be_valid
    end

    it "should reject long model" do
      @user.bicycles.build(:model => "c" * 101)
    end

    it "should require nonblank make" do
      @user.bicycles.build(:make => " ").should_not be_valid
    end

    it "should reject long make" do
      @user.bicycles.build(:make => "c" * 101)
    end
  end

end
