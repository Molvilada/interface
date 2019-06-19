class WsimagesController < ApplicationController
    soap_service namespace: 'urn:WashOutImage', camelize_wsdl: :lower
    # show user images case
    soap_action "userImages",
                :args   => { :username => :string},
                :return => :string
    def userImages
        @API_URL = 'http://192.168.99.113:8080/images/' + params[:username]
        response = HTTParty.get(@API_URL)
        validate = true
        render :soap => response    
    end 
    
end

class Images < WashOut::Type
    map :universe => {
          :base_64 => :string,
    }
end
  
class ImagesContainer < WashOut::Type
    type_name 'images'
    map :images => Images
end
