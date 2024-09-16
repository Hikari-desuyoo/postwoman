require_relative __dir__ + '/../lib/dependencies.rb'
require 'pty'

package_path = File.join(Dir.tmpdir, 'my_package')
dotfile_path = File.join(Dir.tmpdir, '.postwoman')

FileUtils.rm_rf(package_path) if Dir.exist?(package_path)
FileUtils.rm_rf(dotfile_path) if Dir.exist?(dotfile_path)

ENV['HOME'] = Dir.tmpdir

I18n.locale = :en
StartUp.execute
Package.load(package_path, create_flag: true)
DynamicDependencies.load_loaders

Dir[__dir__ + '/support/**/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.include StdoutHelper

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    Env.requests.clear
    Env.workbench.clear

    allow(Readline).to receive(:get_screen_size) { [Float::INFINITY, Float::INFINITY] }
  end

  config.after(:each) do
    Dir.glob('loaders/*').each do |file|
      File.delete(file) unless File.basename(file) == 'base.rb'
    end
    Dir.glob('scripts/*').each do |file|
      File.delete(file) unless File.basename(file) == 'base.rb'
    end
    FileUtils.rm_rf(dotfile_path)
  end

  config.mock_framework = :rspec
end
