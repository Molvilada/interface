class WschatsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def chat
        client = Savon.client(wsdl: "http://www.dneonline.com/calculator.asmx?wsdl")
        message = { intA: params[:username].to_i, intB: params[:message].to_i }
        response = client.call(:add, message: message)
        response_json = response.body[:add_response]
        render json: response_json.to_json
    end

end
