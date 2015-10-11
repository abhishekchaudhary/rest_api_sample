require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "the truth" do
    assert true
  end

  test "should not save user without title" do
  	user = User.new
  	assert_not user.save, "Saved the user without a username and phone"
  end
end
