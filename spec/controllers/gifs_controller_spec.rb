require 'spec_helper'

describe GifsController, type: :controller do

  context "#index" do
    it "should give authentication error" do
      get :index
      expect(response.status).to eq(302)
    end
  end
end