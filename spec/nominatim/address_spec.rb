require 'spec_helper'

describe Nominatim::Address do

  describe '#attraction' do
    it 'returns a attraction when set with attraction' do
      address = Nominatim::Address.new(attraction: 'Eiffel Tower')
      expect(address.attraction).to eq 'Eiffel Tower'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      expect(address.attraction).to be_nil
    end
  end

  describe '#clothes' do
    it 'returns clothes when set with clothes' do
      address = Nominatim::Address.new(clothes: 'XXI')
      expect(address.clothes).to eq 'XXI'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      expect(address.clothes).to be_nil
    end
  end

  describe '#house_number' do
    it 'returns a house number when set with house_number' do
      address = Nominatim::Address.new(house_number: 1)
      expect(address.house_number).to eq 1
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      expect(address.house_number).to be_nil
    end
  end

  describe '#road' do
    it 'returns a road when set with road' do
      address = Nominatim::Address.new(road: 'Infinite Loop')
      expect(address.road).to eq 'Infinite Loop'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      expect(address.road).to be_nil
    end
  end

  describe '#commercial' do
    it 'returns a commercial when set with commercial' do
      address = Nominatim::Address.new(commercial: 'Apple, Inc.')
      expect(address.commercial).to eq 'Apple, Inc.'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      expect(address.commercial).to be_nil
    end
  end

  describe '#pedestrian' do
    it 'returns a pedestrian when set with pedestrian' do
      address = Nominatim::Address.new(pedestrian: 'Avenue Pierre Loti')
      expect(address.pedestrian).to eq 'Avenue Pierre Loti'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      expect(address.pedestrian).to be_nil
    end
  end

  describe '#suburb' do
    it 'returns a suburb when set with suburb' do
      address = Nominatim::Address.new(suburb: 'Quartier du Gros Caillou')
      expect(address.suburb).to eq 'Quartier du Gros Caillou'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      expect(address.suburb).to be_nil
    end
  end

  describe '#city_district' do
    it 'returns a city district when set with city_district' do
      address = Nominatim::Address.new(city_district: '7th Arrondissement')
      expect(address.city_district).to eq '7th Arrondissement'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      expect(address.city_district).to be_nil
    end
  end

  describe '#city' do
    it 'returns a city when set with city' do
      address = Nominatim::Address.new(city: 'Santa Clara')
      expect(address.city).to eq 'Santa Clara'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      expect(address.city).to be_nil
    end
  end

  describe '#administrative' do
    it 'returns a administrative when set with administrative' do
      address = Nominatim::Address.new(administrative: 'Paris')
      expect(address.administrative).to eq 'Paris'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      expect(address.administrative).to be_nil
    end
  end

  describe '#county' do
    it 'returns a county when set with county' do
      address = Nominatim::Address.new(county: 'Santa Clara County')
      expect(address.county).to eq 'Santa Clara County'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      expect(address.county).to be_nil
    end
  end

  describe '#state_district' do
    it 'returns a state disctrict when set with state_district' do
      address = Nominatim::Address.new(state_district: 'West Midlands')
      expect(address.state_district).to eq 'West Midlands'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      expect(address.state_district).to be_nil
    end
  end

  describe '#state' do
    it 'returns a state when set with state' do
      address = Nominatim::Address.new(state: 'California')
      expect(address.state).to eq 'California'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      expect(address.state).to be_nil
    end
  end

  describe '#postcode' do
    it 'returns a postcode when set with postcode' do
      address = Nominatim::Address.new(postcode: '95014')
      expect(address.postcode).to eq '95014'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      expect(address.postcode).to be_nil
    end
  end

  describe '#country' do
    it 'returns a country when set with country' do
      address = Nominatim::Address.new(country: 'United States of America')
      expect(address.country).to eq 'United States of America'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      expect(address.country).to be_nil
    end
  end

  describe '#country_code' do
    it 'returns a country code when set with country_code' do
      address = Nominatim::Address.new(country_code: 'us')
      expect(address.country_code).to eq 'us'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      expect(address.country_code).to be_nil
    end
  end

  describe '#place' do
    it 'returns a place when set with place' do
      address = Nominatim::Address.new(place: 'Europe')
      expect(address.place).to eq 'Europe'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      expect(address.place).to be_nil
    end
  end
end
