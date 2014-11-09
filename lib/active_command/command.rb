require 'active_support/callbacks'
require 'active_command/integration'

module ActiveCommand
  class Command
    include Virtus.model(strict: true)
    include Virtus.group

    include Integration

    attribute :result

    include ActiveSupport::Callbacks

    define_callbacks :attributes
    define_callbacks :validate
    define_callbacks :execute

    def self.run(*args)
      instance = new(*args)
      instance.result = instance.trigger
      instance
    end

    def initialize(*args)
      run_callbacks :attributes do
        super
      end
    end

    def trigger
      run_callbacks :execute do
        execute
      end
    end

    def execute
      fail NotImplementedError
    end
  end
end
