# check this once I get solution to 7.34 exercises
# specifically, check "post signup_path" for correctness

require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do 
    get signup_path
  
    assert_no_difference 'User.count' do
      post signup_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new' 
    assert_select 'div#<CSS id for error explanation>'
    assert_select 'div.<CSS class for error explanation>'
  end
  
end
