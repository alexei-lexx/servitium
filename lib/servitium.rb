require "servitium/version"

module Servitium
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def call(*args)
      new(*args).call
    end
  end
end
