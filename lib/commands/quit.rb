module Commands
  class Quit < Base
    ALIASES = %w[exit q].freeze
    DESCRIPTION = 'Exits the application'.freeze

    def execute
      exit
    end
  end
end
