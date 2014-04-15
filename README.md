# ConfigFile

The ConfigFile gem handles configuration file loading and validation.

## Installation

Add this line to your application's Gemfile:

    gem 'config_file'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install config_file

## Usage


Raise an error if config file or certain keys are missing:

```
c = ConfigFile.new("./config/mandrill.yml")
c.validate_existence!
c.validate_key!('api_key', /\A\w{22}\Z/)

Mandrill.api_key = c.data['api_key']

```

Only use a warning in dev or test environment:

```
ConfigFile.configure do |c|
  c.env = ENV['WEBKITE_ENV'] # default to :dev if nil
  c.alias_env(:default, :dev) # use alias for keys in file
  c.alias_env(:development, :dev)
end

c = ConfigFile.new("./config/mandrill.yml", dev: :warn, test: warn)
c.validate_existence!
=> nil

c.validate_key!('api_key', /\A\w{22}\Z/)
=> nil

Mandrill.api_key = c.data['api_key']
=> nil

```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/config_file/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
