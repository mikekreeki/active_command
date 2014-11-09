require 'spec_helper'

require 'active_command/concurrent'

module ActiveCommand
  describe Command do
    subject do
      TestCommand = Class.new(Command) do
        include Concurrent

        attribute :name

        def execute
          'result'
        end
      end
    end

    describe 'Attributes' do
      it { should have_attribute(:name) }
    end

    describe '.run' do
      let(:instance) { subject.run(name: 'Andrew') }

      it 'returns the command' do
        expect(instance).to be_instance_of TestCommand
      end

      it 'assigns the attributes' do
        expect(instance.name).to eq 'Andrew'
      end

      it 'executes the command' do
        expect(instance.result.value).to eq 'result'
      end
    end
  end
end
