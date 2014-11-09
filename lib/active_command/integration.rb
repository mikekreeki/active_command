require 'active_support/concern'
require 'active_support/core_ext/string/inflections'
require 'set'

module ActiveCommand
  module Integration
    extend ActiveSupport::Concern

    def publish(message, *args)
      self.class.listeners.each do |listener|
        if listener.instance_methods.include?(message)
          listener.new.send(message, *args)
        end
      end
    end

    module ClassMethods

      def subscribe(listener)
        listeners << listener.to_s.camelize.constantize
      end

      def listeners
        @listeners ||= Set.new
      end
    end
  end
end
