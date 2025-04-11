require 'spec_helper'

describe Nominatim::Place do
  describe '#display_name' do
    it 'returns a full name when set with display_name' do
      place = Nominatim::Place.new(display_name: 'Los Angeles, California, United States of America')
      expect(place.display_name).to eq 'Los Angeles, California, United States of America'
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      expect(place.display_name).to be_nil
    end
  end

  describe '#class' do
    it 'returns a class when set with class' do
      place = Nominatim::Place.new(class: 'place')
      expect(place.class).to eq 'place'
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      expect(place.class).to be_nil
    end
  end

  describe '#type' do
    it 'returns a type when set with type' do
      place = Nominatim::Place.new(type: 'county')
      expect(place.type).to eq 'county'
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      expect(place.type).to be_nil
    end
  end

  describe '#address' do
    it 'returns a Nominatim::Address when set' do
      place = Nominatim::Place.new(address: {county: 'Los Angeles', state: 'California', country: 'United States of America'})
      expect(place.address).to be_a Nominatim::Address
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      expect(place.address).to be_nil
    end
  end

  describe '#lat' do
    it 'returns a latitude when set with lat' do
      place = Nominatim::Place.new(lat: '52.5487969264788', lon: '-1.81642935385411')
      expect(place.lat).to eq 52.5487969264788
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      expect(place.lat).to be_nil
    end
  end

  describe '#latitude' do
    it 'returns a latitude when set with lat' do
      place = Nominatim::Place.new(lat: '52.5487969264788', lon: '-1.81642935385411')
      expect(place.latitude).to eq 52.5487969264788
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      expect(place.latitude).to be_nil
    end
  end

  describe '#lon' do
    it 'returns a longitude when set with lon' do
      place = Nominatim::Place.new(lat: '52.5487969264788', lon: '-1.81642935385411')
      expect(place.lon).to eq -1.81642935385411
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      expect(place.lon).to be_nil
    end
  end

  describe '#longitude' do
    it 'returns a longitude when set with lon' do
      place = Nominatim::Place.new(lat: '52.5487969264788', lon: '-1.81642935385411')
      expect(place.longitude).to eq -1.81642935385411
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      expect(place.longitude).to be_nil
    end
  end

  describe '#boundingbox' do
    it 'returns a boundingbox when set with boundingbox' do
      place = Nominatim::Place.new(boundingbox: ["52.5487442016602", "52.5488510131836", "-1.81651306152344", "-1.81634628772736"])
      expect(place.boundingbox).to eq ["52.5487442016602", "52.5488510131836", "-1.81651306152344", "-1.81634628772736"]
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      expect(place.boundingbox).to be_nil
    end
  end

  describe '#bounding_box' do
    it 'returns a bounding box when set with boundingbox' do
      place = Nominatim::Place.new(boundingbox: ["52.5487442016602", "52.5488510131836", "-1.81651306152344", "-1.81634628772736"])
      expect(place.bounding_box).to eq ["52.5487442016602", "52.5488510131836", "-1.81651306152344", "-1.81634628772736"]
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      expect(place.bounding_box).to be_nil
    end
  end

  describe '#polygonpoints' do
    it 'returns polygon points when set with polygonpoints' do
      place = Nominatim::Place.new(polygonpoints: [["-1.816513", "52.5487566"], ["-1.8164913", "52.548824"], ["-1.8164685", "52.5488213"]])
      expect(place.polygonpoints).to be_a Nominatim::Polygon
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      expect(place.polygonpoints).to be_nil
    end
  end

  describe '#place_id' do
    it 'returns a place id when set with place_id' do
      place = Nominatim::Place.new(place_id: '84327444')
      expect(place.place_id).to eq 84327444
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      expect(place.place_id).to be_nil
    end
  end

  describe '#osm_id' do
    it 'returns an osm id when set with osm_id' do
      place = Nominatim::Place.new(osm_id: '90394480')
      expect(place.osm_id).to eq 90394480
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      expect(place.osm_id).to be_nil
    end
  end

  describe '#osm_type' do
    it 'returns an osm type when set with osm_type' do
      place = Nominatim::Place.new(osm_type: 'way')
      expect(place.osm_type).to eq 'way'
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      expect(place.osm_type).to be_nil
    end
  end
end
