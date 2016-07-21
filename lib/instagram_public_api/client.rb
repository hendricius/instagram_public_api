module InstagramPublicApi
  # client that holds the method for communicating with the Instagram API
  class Client
    attr_reader :http_service

    def initialize(http_service: HTTPService.new, default_parameters: {})
      @http_service       = http_service
      @default_parameters = default_parameters.merge(build_default_parameters)
    end

    # returns a location with media attached for the given location id
    #
    # limit: the amount of media that should be fetched.
    # request_parameters: optional parameters that will be passed to the request
    def location_media(location_id, request_parameters: {limit: 1000}, limit: 10)
      location = extract_location_media(location_id, request_parameters: request_parameters)
      # check if we should get more data
      paging_info = location.paging_info
      # poll more data
      while location.total_media_count < limit && paging_info[:has_next_page] do
        request_opts = {}.merge(request_parameters)
        if paging_info && paging_info[:end_cursor]
          request_opts[:max_id] = paging_info[:end_cursor]
        end
        next_page_location = extract_location_media(location_id, request_parameters: request_opts)
        location.add_media(next_page_location.media)
        paging_info = next_page_location.paging_info
        location
      end
      location
    end

    # returns a hashtag with media associated
    #
    # limit: the amount of media that should be fetched.
    # request_parameters: optional parameters that will be passed to the request
    def hashtag_media
      raise ArgumentError, "not implemented yet"
    end

    private

    # performs the actual request to the API.
    #
    # returns a Location object.
    def extract_location_media(location_id, request_parameters: {})
      uri   = "explore/locations/#{location_id}/"
      data  = request(uri: uri, parameters: request_parameters)
      body  = data.body[:location]
      location = Entities::Location.new
      attrs = %i[name lat lng id]
      attrs.each do |attribute|
        location.send("#{attribute}=", body[attribute])
      end
      media = {}
      body[:media].fetch(:nodes, []).each do |medium|
        media[medium[:id]] = Entities::MediumNode.new(medium)
      end
      location.media = media.values
      location.top_posts = body[:top_posts].fetch(:nodes, []).map {|d| Entities::MediumNode.new(d)}
      location.paging_info = body[:media].fetch(:page_info, {})
      location
    end

    # perform the actual request. receives a URI as argument. Optional parameters
    # and request parameter options can be passed.
    #
    # returns the raw http response
    def request(uri:, request_options: {}, parameters: {})
      opts = {
        uri: uri,
        request_options: request_options,
        parameters: @default_parameters.merge(parameters)
      }
      parse_response(http_service.perform_request(opts))
    end

    # Common Parameters required for every call
    def build_default_parameters
      return {
        __a: 1
      }
    end

    # parses the raw response by the remote. returns an object with a raw_response
    # as method and the parsed body associated.
    def parse_response(response)
      OpenStruct.new(
        raw_response: response,
        body: JSON.parse(response.body, symbolize_names: true)
      )
    end


  end
end
