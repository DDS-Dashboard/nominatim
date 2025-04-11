require 'spec_helper'

describe Nominatim do
  describe '.search' do
    it 'returns a Nominatim::Search' do
      expect(Nominatim.search).to be_a Nominatim::Search
    end

    it 'adds a query criterion if given as a parameter' do
      search = Nominatim.search('San Francisco')
      expect(search.criteria[:q]).to eq 'San Francisco'
    end
  end

  describe '.reverse' do
    it 'returns a Nominatim::Reverse' do
      expect(Nominatim.reverse).to be_a Nominatim::Reverse
    end

    it 'adds a reverse query criteria if given as a parameters' do
      reverse = Nominatim.reverse('37.733976', '-122.3912081')
      expect(reverse.criteria[:lat]).to eq '37.733976'
      expect(reverse.criteria[:lon]).to eq '-122.3912081'
    end
  end

  describe '.configure' do

    before do
      Nominatim.config.reset!
    end

    it 'has a default endpoint' do
      expect(Nominatim.config.endpoint).to eq "https://nominatim.openstreetmap.org/"
    end

    it 'sets the endpoint' do
      Nominatim.configure do |config|
        config.endpoint = "http://nominatim.org/"
      end
      expect(Nominatim.config.endpoint).to eq "http://nominatim.org/"
    end

    it 'has a default user agent' do
      expect(Nominatim.config.user_agent).to eq "Nominatim Ruby Gem #{Nominatim::VERSION}"
    end

    it 'sets the user agent' do
      Nominatim.configure do |config|
        config.user_agent = "MyApp"
      end
      expect(Nominatim.config.user_agent).to eq "MyApp"
    end

    it 'has a default email' do
      expect(Nominatim.config.email).to be_nil
    end

    it 'sets the email' do
      Nominatim.configure do |config|
        config.email = "foo@bar.com"
      end
      expect(Nominatim.config.email).to eq "foo@bar.com"
    end
  end
end
