require 'spec_helper'

describe BicyclesController do
  render_views

  describe "access control" do

    it "should deny accesss to 'create'" do
      post :create
      response.should redirect_to(login_path)
    end

    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to(login_path)
    end

  end

  describe "POST 'create'" do

    before(:each) do
      @user = test_sign_in(Factory(:user))
    end

    describe "failure" do

      before(:each) do
        @bike = { :serial_number => "",
                  :make          => "",
                  :model         => ""}
      end

      it "should not create a bicycle" do
        lambda do
          post :create, :bicycle => @bike
        end.should_not change(Bicycle, :count)
      end

      it "should render the home page" do
        post :create, :bicycle => @bike
        response.should render_template('pages/home')
      end
    end

    describe "success" do

      before(:each) do
        @bike = { :serial_number => "123-456-789",
                  :make          => "Cannondale",
                  :model         => "Capo" }
      end

      it "should create a bicycle" do
        lambda do
          post :create, :bicycle => @bike
        end.should change(Bicycle, :count).by(1)
      end

      it "should redirect to the home page" do
        post :create, :bicycle => @bike
        response.should redirect_to(root_path)
      end

      it "should have a flash message" do
        post :create, :bicycle => @bike
        flash[:success].should =~ /bicycle created/i
      end
    end

  end

end
