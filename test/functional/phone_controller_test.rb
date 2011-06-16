require 'test_helper'

class PhoneControllerTest < ActionController::TestCase
  test "should get call" do
    get :call
    assert_response :success
  end

  test "should get text" do
    get :text
    assert_response :success
  end

end
