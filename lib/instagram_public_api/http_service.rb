module InstagramPublicApi
  # http service that performs the requests to the instagram API
  class HTTPService
    API_SERVER = 'https://www.instagram.com/'

    def initialize(proxy_config: nil)
      if proxy_config
        @proxy_config = proxy_config
      elsif InstagramPublicApi.proxy_uri && InstagramPublicApi.proxy_user && InstagramPublicApi.proxy_password
        @proxy_config = {
          uri: InstagramPublicApi.proxy_uri,
          user: InstagramPublicApi.proxy_user,
          password: InstagramPublicApi.proxy_password,
        }
      end
    end


    # The address of the appropriate Expedia server.
    #
    # return a complete server address with protocol
    def server_url
      API_SERVER
    end

    # returns a hash with options for faraday
    def faraday_options
      options = {
        url: server_url
      }
      if @proxy_config
        options[:proxy] = @proxy_config
      end
      options
    end

    # performs the actual http request
    def perform_request(request_options: {}, parameters: {}, uri:)
      args = parameters
      request_options = request_options.merge(faraday_options)
      # figure out our options for this request
      # set up our Faraday connection
      connection = Faraday.new(faraday_options) do |faraday|
        faraday.adapter  Faraday.default_adapter
      end
      connection.get(uri, args)
    end


  end
end
