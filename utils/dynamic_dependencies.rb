module DynamicDependencies
  module_function

  def load_loaders
    return unless load_loader('loaders/base.rb')

    Dir[File.dirname(__FILE__) + '/../loaders/**/*.rb'].each do |file|
      load_loader(file)
    end
  end

  def load_loader(loader_path)
    load loader_path
  rescue Exception => e
    puts "Loader '#{loader_path.split('/').last[..-4]}' has syntax errors and couldn't be loaded:".red
    puts e.full_message
  end
end
