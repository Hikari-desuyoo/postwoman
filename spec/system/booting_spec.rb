require 'spec_helper'

describe 'Postwoman' do
  it 'boots up succesfully in sandbox mode' do
    PTY.spawn('postwoman') do |stdout, _, _|
      output = unstyled(stdout.read_all)

      expect(output).to include("Type 'help' for more information")
      expect(output).to include('sandbox> ')
    end
  end
end
