require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class CertsHelper
      def self.validate_provisions(list)
        provisions_pairs = list.split(",")
        possible_wrong_pair = provisions_pairs.select { |pair| !!pair[/.+:.+/] == false }
        unless possible_wrong_pair.length == 0
          error = [
            "Invalid format for next pairs:"
          ] + possible_wrong_pair + [
            "Pairs should be colon-separated!",
            "Example: Some Project Development:com.e-legion.some-project"
          ]
          UI.error(error.join("\n"))
        end
        return provisions_pairs.map { |pair| pair.split(":").map { |value| value.strip } }
      end
    end
  end
end
