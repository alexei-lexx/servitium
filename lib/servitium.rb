require "servitium/version"
require "active_support"

module Servitium
  extend ActiveSupport::Concern

  class_methods do
    def call(*args)
      new(*args).call
    end
  end
end
