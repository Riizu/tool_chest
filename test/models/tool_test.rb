require 'test_helper'

class ToolTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:category)
  should validate_presence_of(:name)
  should validate_presence_of(:price)
  should validate_presence_of(:quantity)
end
