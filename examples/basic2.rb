require_relative "../lib/servitium"

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

puts PingGoogle.call("ga.com", timeout: 10) # "ping ga.com with timeout = 10"
