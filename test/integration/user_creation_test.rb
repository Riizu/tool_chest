require 'test_helper'

class UserCreationTest < ActionDispatch::IntegrationTest
  test "a user can be created" do
    visit new_user_path
    fill_in "Username", with: "Parker"
    fill_in "Password", with: "Password"
    click_button "Create Account"

    assert page.has_content?("Welcome, Parker")
  end
end
