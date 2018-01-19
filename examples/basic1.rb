require_relative "../lib/servitium"

class PingGoogle
  include Servitium

  def call
    "ping google.com"
  end
end

puts PingGoogle.call # "ping google.com"
