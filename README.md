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
opts = {
  limit: 100
}
InstagramPublicApi.location_media("263928560", {})
```

**Get media for a hashtag:**

```
opts = {
  limit: 100
}
InstagramPublicApi.hashtag_media("racoon", opts)
```


### Advanced configuration

You can configure an HTTP Proxy in case you would like the requests to be done via an external service.


```

opts = {
  proxy_uri: "https://foo.com:3129",
  proxy_user: "dalai",
  proxy_password: "lama" 
}

InstagramPublicApi.proxy_config = InstagramPublicApi::ProxyConfig.new(opts)

```

This proxy config will be used as the default proxy configuration for all following requests. Each request also receives an options array, where you can pass a new proxy configuration if you like.



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hendricius/instagram_public_api.
