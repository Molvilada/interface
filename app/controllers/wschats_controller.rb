class WschatsController < ApplicationController
    
    def chat
        client = Savon.client(wsdl: "http://www.dneonline.com/calculator.asmx?wsdl")
        response = client.call(:add) do
            message intA: 1, intB: 2
            convert_request_keys_to :camelcase
        end
        puts response
    end

end
