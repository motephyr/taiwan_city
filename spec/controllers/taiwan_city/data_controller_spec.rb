require 'spec_helper'

describe TaiwanCity::DataController do

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', id: '000', use_route: 'taiwan_city'
      response.should be_success
    end
  end

end
