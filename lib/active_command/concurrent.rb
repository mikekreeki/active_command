require 'active_support/concern'
require 'concurrent'

module ActiveCommand
  module Concurrent

    def trigger
      run_callbacks :execute do
        self.result = ::Concurrent::Future.execute { execute }
      end
    end
  end
end
