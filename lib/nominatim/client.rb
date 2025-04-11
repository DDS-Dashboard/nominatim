require 'http'

module Nominatim
  class Client
    # Performs an HTTP GET request
    def get(path, params = {})
      params[:format] = 'json'
      params[:email] = Nominatim.config.email if Nominatim.config.email
      params[:key] = Nominatim.config.key if Nominatim.config.key

      headers= {
        'Accept' => 'application/json',
        'Content-Type' => 'application/json',
        'User-Agent' => Nominatim.config.user_agent,
        'Accept-Language' => Nominatim.config.accept_language
      }

      response = HTTP.get(URI.join(Nominatim.config.endpoint, path), params: params, headers: headers)
      body = response.body.to_s

      MultiJson.load(body, symbolize_keys: true)
    end
  end
end
