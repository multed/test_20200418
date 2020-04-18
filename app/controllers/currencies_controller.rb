class CurrenciesController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  TOKEN = "secret"

  before_action :authenticate


  def index
    @currencies = Currency.all
    render json: @currencies
  end

  def show
    @currency = Currency.find_by id: params[:id]
    render json: @currency
  end

  private
    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        request.headers['Authorization'].gsub(/^Bearer /, '') == TOKEN
      end
    end
end
