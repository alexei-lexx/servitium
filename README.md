# Servitium

This gem provides DLS to create service-like objects.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "servitium", github: "alexei-lexx/servitium"
```

And then execute:

    $ bundle

## Usage

```ruby
class PingGoogle
  include Servitium

  def call
    "ping google.com"
  end
end

PingGoogle.call # "ping google.com"
```

or when the service takes arguments

```ruby
class PingGoogle
  include Servitium

  def initialize(host, timeout:)
    @host = host
    @timeout = timeout
  end

  def call
    "ping #{@host} with timeout = #{@timeout}"
  end
end

PingGoogle.call("ga.com", timeout: 10) # "ping ga.com with timeout = 10"
```

## Development

```
bin/rubocop
bin/rspec
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alexei-lexx/servitium.
