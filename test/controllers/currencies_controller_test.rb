require 'test_helper'

class CurrenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @currency = currencies(:one)
  end

  test "should get index" do
    authorization = 'Bearer secret'
    get currencies_url, headers: { 'Authorization' => authorization}, as: :json
    assert_response :success
  end

  test "should show currency" do
    authorization = 'Bearer secret'
    get currency_url(@currency), headers: { 'Authorization' => authorization}, as: :json
    assert_response :success
  end

end
