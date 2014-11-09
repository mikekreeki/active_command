require 'spec_helper'

module ActiveCommand
  TestListener = Class.new(Listener) do

    def something_happened(value)
      value.expected!
    end
  end

  TestCommand = Class.new(Command) do
    subscribe 'active_command/test_listener'

    attribute :value

    def execute
      publish :something_happened, value
    end
  end

  describe Integration do
    let(:value)   { double }
    let(:command) { TestCommand.new(value: value) }

    before do
      allow(value).to receive(:expected!)

      command.execute
    end

    it 'it publishes an event to subscribed listeners' do
      expect(value).to have_received(:expected!)
    end
  end
end
