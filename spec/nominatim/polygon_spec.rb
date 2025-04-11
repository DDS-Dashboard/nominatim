require 'spec_helper'

describe Nominatim::Polygon do

  let(:polygon) { Nominatim::Polygon.new([[-1.816513, 52.5487566], [-1.8164913, 52.548824], [-1.8164685, 52.5488213]]) }

  it 'sets coordinates correctly' do
    expect(polygon.coordinates.first.lat).to eq -1.816513
    expect(polygon.coordinates.first.lon).to eq 52.5487566
  end

  describe '#coordinates' do
    it 'returns an array of coordinates' do
      polygon.coordinates.each do |point|
        expect(point).to be_a(Nominatim::Point)
      end
    end
  end
end