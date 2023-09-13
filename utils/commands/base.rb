module Commands
  class Base
    ALIASES = [].freeze
    DESCRIPTION = ''.freeze
    ARGS = {}.freeze

    attr_reader :args

    def initialize(args)
      @args = args
    end

    def execute; end

    def self.help_rows
      command_name = name.split('::')[1].upcase
      [
        ["#{command_name.green} (#{self::ALIASES.join(', ')})".green],
        ["> #{command_name.downcase} #{self::ARGS.map { |name, _| "<#{name}>" }.join(' ')}".gray],
        *args_rows,
        [self::DESCRIPTION]
      ]
    end

    def self.args_rows
      return [] if self::ARGS.empty?

      self::ARGS.map do |name, description|
        ["#{name.to_s.yellow} → #{description}"]
      end
    end

    private

    def workbench
      Env.workbench
    end

    def edit_loader(name)
      system("#{ENV['EDITOR']} loaders/#{name}.rb")
    end

    def edit_helper(name)
      system("#{ENV['EDITOR']} loaders/utils/#{name}.rb")
    end

    def new_or_edit(file_name, path, default_content, label)
      path = "#{path}#{file_name}.rb"

      if File.exist?(path)
        puts("Editing #{label}")
      else
        puts("Creating #{'new'.green} #{label}")
        File.open(path, 'w') do |f|
          f.write(default_content)
        end
      end

      open_in_editor(path)
    end

    def open_in_editor(path)
      return puts "Could not open loader because default editor isn't set.".yellow if ENV['EDITOR'].nil?

      system("#{ENV['EDITOR']} #{path}")
    end

    def obrigatory_positional_arg(index, custom_name = nil)
      positional_names = self.class::ARGS.keys
      name = custom_name || positional_names[index]
      value = args[index]
      return puts("Missing ##{index + 1} positional argument: '#{name}'".red) unless value

      value
    end

    def start_debug
      case ENV['DEBUGGER']
      when 'pry'
        binding.pry
      when 'byebug'
        byebug
      when 'debug'
        binding.break
      end
    end
  end
end
