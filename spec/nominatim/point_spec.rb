require 'spec_helper'

describe Nominatim::Point do
  let(:point) { Nominatim::Point.new(52.5487969264788, -1.81642935385411) }

  describe '#lat' do
    it 'returns the latitude' do
      expect(point.lat).to eq 52.5487969264788
    end
  end

  describe '#latitude' do
    it 'returns the latitude' do
      expect(point.latitude).to eq 52.5487969264788
    end
  end

  describe '#lon' do
    it 'returns the longitude' do
      expect(point.lon).to eq -1.81642935385411
    end
  end

  describe '#longitude' do
    it 'returns the longitude' do
      expect(point.longitude).to eq -1.81642935385411
    end
  end

  describe '#to_a' do
    it 'returns an array representing the point' do
      expect(point.to_a).to eq [52.5487969264788, -1.81642935385411]
    end
  end

  describe '#to_s' do
    it 'returns a string representing the point' do
      expect(point.to_s).to eq '[52.5487969264788, -1.81642935385411]'
    end
  end

  describe '#==' do
    it 'returns true when objects coordinates are the same' do
      other = Nominatim::Point.new(52.5487969264788, -1.81642935385411)
      expect((point == other)).to be_truthy
    end

    it 'returns false when objects coordinates are different' do
      other = Nominatim::Point.new(-1.81642935385411, 52.5487969264788)
      expect((point == other)).to be_falsey
    end
  end
end