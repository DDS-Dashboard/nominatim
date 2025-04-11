require 'spec_helper'

describe Nominatim::Reverse do

  let(:reverse) { Nominatim::Reverse.new }

  it 'has no criteria set' do
    expect(reverse.criteria).to be_empty
  end

  it 'allows chaining of criterions' do
    reverse.lat('37.733976').lon('-122.3912081').address_details(1)
    expect(reverse.criteria[:lat]).to eq '37.733976'
    expect(reverse.criteria[:lon]).to eq '-122.3912081'
    expect(reverse.criteria[:addressdetails]).to eq 1
  end

  describe '#each' do
    let(:reverse) { Nominatim::Reverse.new.lat('37.733976').lon('-122.3912081').address_details(1) }

    before do
      stub_get('/reverse').
        with(query: { lat: '37.733976', lon: '-122.3912081', addressdetails: 1 }).
        to_return(body: fixture('reverse.json'))
    end

    it 'iterates over the matching places' do
			expect(reverse.fetch).to be_a Nominatim::Place
    end

    it 'returns correct places' do
      expect(reverse.fetch.display_name).to eq '4900, 3rd Street, San Francisco, California, 94124, United States of America'
      expect(reverse.fetch.address.city).to eq 'San Francisco'
      expect(reverse.fetch.address.state).to eq 'California'
    end
  end

  describe '#lat' do
    it 'adds a latitude criterion' do
      reverse.lat('37.733976')
      expect(reverse.criteria[:lat]).to eq '37.733976'
    end
  end

  describe '#lon' do
    it 'adds a longitude criterion' do
      reverse.lon('-122.3912081')
      expect(reverse.criteria[:lon]).to eq '-122.3912081'
    end
  end

  describe '#address_details' do
    it 'adds an address details criterion' do
      reverse.address_details(true)
      expect(reverse.criteria[:addressdetails]).to eq 1
    end

    it 'sets 1 when set with true' do
      reverse.address_details(true)
      expect(reverse.criteria[:addressdetails]).to eq 1
    end

    it 'sets 0 when set with false' do
      reverse.address_details(false)
      expect(reverse.criteria[:addressdetails]).to eq 0
    end
  end
end
