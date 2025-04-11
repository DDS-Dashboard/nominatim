require 'spec_helper'

describe Nominatim::Client do
  after do
    WebMock.reset!
  end

  describe '#get' do
    before do
       stub_request(:get, "#{URI.join(Nominatim::Configuration::DEFAULT_ENDPOINT, "search")}?format=json").
         with(
           headers: {
       	    'Accept'=>'application/json',
       	    'Accept-Language'=>'en',
       	    'Connection'=>'close',
       	    'Content-Type'=>'application/json',
       	    'Host'=>'nominatim.openstreetmap.org',
       	    'User-Agent'=>'Nominatim Ruby Gem 0.0.6'
           }).
         to_return(status: 200, body: "[]", headers: {})
    end


    it 'parses the body' do
      response = Nominatim::Client.new.get('/search')

      expect(response).to eq []
    end
  end
end