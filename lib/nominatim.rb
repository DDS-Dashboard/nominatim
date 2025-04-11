require 'multi_json'
require_relative "./nominatim/version"
require_relative "./nominatim/configuration"
require_relative "./nominatim/point"
require_relative "./nominatim/polygon"
require_relative "./nominatim/address"
require_relative "./nominatim/place"
require_relative "./nominatim/client"
require_relative "./nominatim/search"
require_relative "./nominatim/reverse"

module Nominatim

  # @return [Nominatim::Search]
  def self.search(q = nil)
    search = Nominatim::Search.new
    search.query(q) if q
    search
  end

  # @return [Nominatim::Reverse]
  def self.reverse(lat = nil, lon = nil)
    search = Nominatim::Reverse.new
    search.lat(lat).lon(lon) if lat && lon
    search
  end

  # @return [Nominatim::Configuration]
  def self.config
    @config ||= Configuration.new
  end

  def self.configure(&block)
    config.configure &block
  end
end
