require "test_helper"

class Bookers2ControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bookers2_new_url
    assert_response :success
  end

  test "should get index" do
    get bookers2_index_url
    assert_response :success
  end

  test "should get show" do
    get bookers2_show_url
    assert_response :success
  end

  test "should get edit" do
    get bookers2_edit_url
    assert_response :success
  end
end
