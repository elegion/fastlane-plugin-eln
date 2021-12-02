require 'fastlane/action'
require_relative '../helper/eln_helper'

module Fastlane
  module Actions
    class ElnCertsUpdateAction < Action
      def self.run(params)
        list = params[:eln_certs_provision_profile_name_list]
        provisions_pairs = Helper::CertsHelper.validate_provisions(list)
        other_action.register_devices
        provisions_pairs.each do |key, value|
          other_action.match(
            profile_name: key,
            app_identifier: value,
            readonly: true,
            force_for_new_devices: true,
            force: true
          )
        end
      end

      def self.authors
        ["viktor.volkov@e-legion.com"]
      end

      def self.description
        "Adds new devices and force updates provision profiles"
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :eln_certs_provision_profile_name_list,
                                    env_name: "ELN_CERTS_PROVISION_PROFILE_NAME_LIST",
                                 description: "Provisions and identifiers to create. Provision and identifiers should be separated by colon, pairs should be separated by comma, e.g \"profile name_1:identifier_1,profile name_2:identifier_2\"",
                                    optional: false,
                                        type: String,
                                        verify_block: proc do |value|
                                          UI.user_error("Certificates and provisions are empty!") unless value && !value.empty?
                                        end)
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
