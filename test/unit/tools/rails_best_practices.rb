module Test
  module Quality
    module Tools
      # Test for the 'rails_best_practices' tool within the quality gem
      module RailsBestPractices
        def expect_rails_best_practices_run(quality_checker)
          @mocks[:quality_checker_class]
            .expects(:new).with('rails_best_practices', rails_best_practices_args)
            .returns(quality_checker)
          expect_find_ruby_files
          expect_installed('rails_best_practices')
        end

        private

        def rails_best_practices_args
          "--only #{ruby_files_glob}"
        end
      end
    end
  end
end
