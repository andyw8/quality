module Quality
  module Tools
    # Adds 'flay' tool support to quality gem
    module Flay
      private

      def quality_flay
        ratchet_quality_cmd('flay',
                            args: "--mass 75 --timeout 99999 #{ruby_files}",
                            emacs_format: true) do |line|
          if line =~ /^[0-9]*\).* \(mass = ([0-9]*)\)$/
            Regexp.last_match[1].to_i
          else
            0
          end
        end
      end
    end
  end
end
