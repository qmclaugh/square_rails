require "square_rails/version"
require "square_rails/engine"
require 'unirest'

module SquareRails
    
    #TODO: error handling 

    def self.locations(token)
      @url = "#{SQUARE_CONNECT_HOST}/v1/me/locations"
      @token = token
      self.get_data_from_square
    end

    def self.payments(token,location)
      if location.is_a?(Hash)
        loc_id = location['id']
      else
        loc_id = location
      end

      @url = "#{SQUARE_CONNECT_HOST}/v1/#{loc_id}/payments"
      @token =token
      self.get_data_from_square
    end

    def self.merchant(token)
      @url = "#{SQUARE_CONNECT_HOST}/v1/me"
      @token = token
      self.get_data_from_square
    end

    def self.get_data_from_square
      headers = {'Authorization' => 'Bearer ' + @token, 'Accept' => 'application/json', "Content-Type"=> "application/json"}
      res = Unirest.get @url, headers: headers
      res.body
    end

end