class WsimagesController < ApplicationController
    soap_service namespace: 'urn:WashOutImage', camelize_wsdl: :lower
    # show user images case
    soap_action "userImages",
                :args   => { :username => :string},
                :return => :boolean
    def userImages
        @API_URL = 'http://www.splashbase.co/api/v1/images/latest'
        response = HTTParty.get(@API_URL)
        validate = true
        if response.nil?:
            validate = false
        end
        render :soap => validate    

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
