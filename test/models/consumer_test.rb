require 'test_helper'

class ConsumerTest < ActiveSupport::TestCase
  
  test "the truth" do
    assert true
  end

  test "should not save consumer without title" do
  	consumer = Consumer.new
  	assert_not consumer.save, "Saved the consumer without a username and phone"
  end
end
