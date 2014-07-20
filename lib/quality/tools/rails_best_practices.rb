module Quality
  module Tools
    # Adds 'rails_best_practices' tool support to quality gem
    module RailsBestPractices
      private

      def quality_rails_best_practices
        args = "--only #{ruby_files_glob}"
        ratchet_quality_cmd('rails_best_practices',
                            args: args,
                            emacs_format: true,
                            gives_error_code_on_violations: true) do |line|
          self.class.count_rails_best_practices_violations(line)
        end
      end

      def self.included(base)
        base.extend ClassMethods
      end

      # See RailsBestPractices.included
      module ClassMethods
        def count_rails_best_practices_violations(line)
          if line =~ /.rb:\d+ - /
            1
          else
            0
          end
        end
      end
    end
  end
end
