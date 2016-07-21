require 'json'
require 'faraday'
require 'faraday_middleware'
require 'active_support/core_ext/hash/indifferent_access'
require 'pry'
require 'pp'
require 'virtus'

require "instagram_public_api/version"
require "instagram_public_api/http_service"
require "instagram_public_api/client"
require "instagram_public_api/entities/location"
require "instagram_public_api/entities/medium_node"

module InstagramPublicApi
  class << self
    attr_accessor :proxy_uri, :proxy_password, :proxy_user
  end
end
