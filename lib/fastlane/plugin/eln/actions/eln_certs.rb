require 'fastlane/action'
require_relative '../helper/eln_helper'

module Fastlane
  module Actions

    class ElnCertsAction < Action

      def self.authors
        ["viktor.volkov@e-legion.com"]
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :eln_certs_provision_profile_name_list,
                                    env_name: "ELN_CERTS_PROVISION_PROFILE_NAME_LIST",
                                 description: "Provisions and identifiers to create. Provision and identifiers should be separated by colon, pairs should be separated by comma, e.g \"profile name_1:identifier_1,profile name_2:identifier_2\"",
                                    optional: false,
                                        type: String),
        ]
      end
    end
  end
end
