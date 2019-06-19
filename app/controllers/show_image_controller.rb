class ShowImageController < ApplicationController
    # GET /images/ldmolinav
  def show
    if params[:username].nil?
      render json: {error: 'Username empty'}, status: :no_content
    else
    # @API_URL = '192.168.99.115'+params[:username]
    # response = HTTParty.get(@API_URL)
    # render json: response
      @API_URL = 'http://www.splashbase.co/api/v1/images/latest'
      response = HTTParty.get(@API_URL)
      my_xml = JSON.parse(response.body).to_xml
      puts my_xml
    end
  end
end
