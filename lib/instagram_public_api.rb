require 'json'
require 'faraday'
require 'faraday_middleware'
require 'active_support/core_ext/hash/indifferent_access'

require "instagram_public_api/version"

module InstagramPublicApi
  class << self
    attr_accessor :proxy_uri, :proxy_password, :proxy_user
  end
end
