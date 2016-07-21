# Instagram Public API client

A client/scraper/crawler for the public Instagram API. The client comes with handy methods such as passing a limit. The client will then proceed and crawl more data as required. Advanced configuration can be done using an http proxy.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'instagram_public_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install instagram_public_api

## Usage

**Get media for a location:**

```
InstagramPublicApi::Client.new.location_media("263928560", limit: 100, request_parameters: {})
```

**Get media for a hashtag:**

```
InstagramPublicApi::Client.new.hashtag_media("raccoon", limit: 100, request_parameters: {})
```


### Advanced configuration

You can configure an HTTP Proxy in case you would like the requests to be done via an external service.


```
InstagramPublicApi.proxy_uri      = "http://foo"
InstagramPublicApi.proxy_user     = "ubuntu"
InstagramPublicApi.proxy_password = "mycrazypassword"

```

This proxy config will be used as the default proxy configuration for all following requests. When creating a client, you can pass an optional `http_service` with different proxy options as needed.

``` 
opts = {
  uri: "http://customuri.com",
  user: "customuser",
  password: "custom-password",
}
service = InstagramPublicApi::HTTPService.new(proxy_config: opts)
client  = InstagramPublicApi::Client.new(http_service: service)

```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hendricius/instagram_public_api.
