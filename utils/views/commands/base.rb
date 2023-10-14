module Views
  module Commands
    module Base
      module_function

      def missing_positional_argument(index, name)
        str =  '<fail>'
        str << I18n.t('commands.base.missing_positional_argument', index:, name:)
        str << '</fail>'

        Style.apply(str)
      end

      def editor_not_found
        str =  '<warning>'
        str << I18n.t('commands.base.editor_not_found')
        str << '</warning>'

        Style.apply(str)
      end

      def editing(name)
        str =  '<box>'
        str << I18n.t('commands.base.editing', name:)
        str << '</box>'

        Style.apply(str)
      end

      def creating(name)
        str =  '<box><success>'
        str << I18n.t('commands.base.creating', name:)
        str << '</success></box>'

        Style.apply(str)
      end
    end
  end
end
