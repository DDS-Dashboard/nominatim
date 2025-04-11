require 'spec_helper'

describe Nominatim::Search do

  let(:search) { Nominatim::Search.new }

  it 'has no criteria set' do
    expect(search.criteria).to be_empty
  end

  it 'allows chaining of criterions' do
    search.query('Los Angeles').limit(1)
    expect(search.criteria[:q]).to eq 'Los Angeles'
    expect(search.criteria[:limit]).to eq 1
  end

  describe '#each' do

    let(:search) { Nominatim::Search.new.query('Los Angeles').limit(1) }

    let(:structured_search){ Nominatim::Search.new.query('Text').city('Los Angeles').country('us').limit(1) }

    before do
      stub_get('/search').
        with(query: { q: 'Los Angeles', limit: 1 }).
        to_return(body: fixture('search.json'))
      stub_get('/search').
        with(query: { city: 'Los Angeles', country: 'us', limit: 1 }).
        to_return(body: fixture('search.json'))
    end

    it 'iterates over the matching places' do
      search.each do |place|
        expect(place).to be_a Nominatim::Place
      end
    end

    it 'returns all matching places' do
      expect(search.count).to eq 1
    end

    it 'returns correct places' do
      expect(search.first.display_name).to eq 'Los Angeles, California, United States of America'
      expect(search.first.lat).to eq 34.0966764
      expect(search.first.lon).to eq -117.7196785
    end

    it 'omits q parameter from structured search' do
      expect(structured_search.first.display_name).to eq 'Los Angeles, California, United States of America'
      expect(structured_search.first.lat).to eq 34.0966764
      expect(structured_search.first.lon).to eq -117.7196785
    end
  end

  describe '#query' do
    it 'adds a query criterion' do
      search.query('Los Angeles')
      expect(search.criteria[:q]).to eq 'Los Angeles'
    end
  end

  describe '#country_codes' do
    it 'adds a country codes criterion' do
      search.country_codes('us')
      expect(search.criteria[:countrycodes]).to eq 'us'
    end

    it 'adds all country codes when set with an array' do
      search.country_codes(['us', 'ca'])
      expect(search.criteria[:countrycodes]).to eq 'us,ca'
    end
  end

  describe '#viewbox' do
    it 'adds a viewbox criterion' do
      search.viewbox(["52.5487442016602", "-1.81651306152344", "52.5488510131836", "-1.81634628772736"])
      expect(search.criteria[:viewbox]).to eq "52.5487442016602,-1.81651306152344,52.5488510131836,-1.81634628772736"
    end
  end

  describe '#street' do
    it 'adds a street criterion' do
      search.street('1000', 'street name')
      expect(search.criteria[:street]).to eq "1000 street name"
    end
  end
  describe '#city' do
    it 'adds a city criterion' do
      search.city('City name')
      expect(search.criteria[:city]).to eq "City name"
    end
  end
  describe '#county' do
    it 'adds a county criterion' do
      search.county('County name')
      expect(search.criteria[:county]).to eq "County name"
    end
  end

  describe '#state' do
    it 'adds a state criterion' do
      search.state('State name')
      expect(search.criteria[:state]).to eq "State name"
    end
  end

  describe '#country' do
    it 'adds a country criterion' do
      search.country('Country name')
      expect(search.criteria[:country]).to eq "Country name"
    end
  end


  describe '#bounded' do
    it 'adds a bounded criterion' do
      search.bounded(true)
      expect(search.criteria[:bounded]).to eq 1
    end

    it 'sets 1 when set with true' do
      search.bounded(true)
      expect(search.criteria[:bounded]).to eq 1
    end

    it 'sets 0 when set with false' do
      search.bounded(false)
      expect(search.criteria[:bounded]).to eq 0
    end
  end

  describe '#polygon' do
    it 'adds a polygon criterion' do
      search.polygon(true)
      expect(search.criteria[:polygon]).to eq 1
    end

    it 'sets 1 when set with true' do
      search.polygon(true)
      expect(search.criteria[:polygon]).to eq 1
    end

    it 'sets 0 when set with false' do
      search.polygon(false)
      expect(search.criteria[:polygon]).to eq 0
    end
  end

  describe '#address_details' do
    it 'adds an address details criterion' do
      search.address_details(true)
      expect(search.criteria[:addressdetails]).to eq 1
    end

    it 'sets 1 when set with true' do
      search.address_details(true)
      expect(search.criteria[:addressdetails]).to eq 1
    end

    it 'sets 0 when set with false' do
      search.address_details(false)
      expect(search.criteria[:addressdetails]).to eq 0
    end
  end

  describe '#exclude_place_ids' do
    it 'excludes given place ids' do
      search.exclude_place_ids('1')
      expect(search.criteria[:exclude_place_ids]).to eq '1'
    end

    it 'adds all place ids when set with an array' do
      search.exclude_place_ids(['1', '2', '3'])
      expect(search.criteria[:exclude_place_ids]).to eq '1,2,3'
    end
  end

  describe '#limit' do
    it 'adds a limit criterion' do
      search.limit(1)
      expect(search.criteria[:limit]).to eq 1
    end
  end

end