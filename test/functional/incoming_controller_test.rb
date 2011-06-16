require 'test_helper'

class IncomingControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
