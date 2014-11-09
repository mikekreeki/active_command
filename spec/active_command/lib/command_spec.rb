require 'spec_helper'

module ActiveCommand
  describe Command do
    subject do
      TestCommand = Class.new(Command) do
        attribute :name

        group :address do
          attribute :street
        end

        def execute
          'result'
        end
      end
    end

    describe 'Attributes' do
      it { should have_attribute(:name) }
      it { should have_attribute(:street) }
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
        expect(instance.result).to eq 'result'
      end
    end
  end
end
