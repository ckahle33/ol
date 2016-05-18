require 'test_helper'
require 'uri'

class Api::V1::BusinessesControllerTest < ActionController::TestCase
  def hashify(query)
    arr = query.split("=")
    Hash[*arr]
  end

  test "businesses index should return success" do
    get :index
    assert_response :success
  end

  test "businesses index should not be nil" do
    get :index
    assert_not_nil JSON.parse(response.body)
  end

  test "businesses index should contain a next url" do
    get :index
    body = JSON.parse(response.body)
    assert_not_nil body["next_url"]
  end

  test "businesses next url should always be one greater than current url" do
    page_number = [1,3,5,7,5,8,9].sample
    get :index, :page_number => page_number
    body = JSON.parse(response.body)
    q = URI(body["next_url"]).query
    hash = hashify(q)

    assert((page_number + 1) == hash["page_number"].to_i)
  end

  test "bussinesses with no params next url page number should be 2" do
    get :index
    body = JSON.parse(response.body)
    q = URI(body["next_url"]).query
    hash = hashify(q)

    assert(hash["page_number"].to_i == 2)
  end

  test "business show action should return success" do
    get :show, :id => 1
    assert_response :success
  end

  test "business show action should return one record" do
    get :show, :id => 1
    body = JSON.parse(response.body)
    assert_not_nil body
  end


end
