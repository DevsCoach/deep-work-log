require "test_helper"

class LogEntryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get log_entry_index_url
    assert_response :success
  end

  test "should get show" do
    get log_entry_show_url
    assert_response :success
  end

  test "should get new" do
    get log_entry_new_url
    assert_response :success
  end

  test "should get create" do
    get log_entry_create_url
    assert_response :success
  end

  test "should get update" do
    get log_entry_update_url
    assert_response :success
  end
end
