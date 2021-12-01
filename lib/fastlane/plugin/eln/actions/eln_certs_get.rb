require 'fastlane/action'
require_relative '../helper/eln_helper'
require_relative 'eln_certs'

module Fastlane
  module Actions
    class ElnCertsGetAction < ElnCertsAction
      def self.run(params)
        list = params[:eln_certs_provision_profile_name_list]
        provisions_pairs = Helper::CertsHelper.validate_provisions(list)
        provisions_pairs.each do |key, value|
          other_action.match(
            profile_name: key,
            app_identifier: value,
            readonly: true,
            force_for_new_devices: false,
            force: false
          )
        end
      end

      def self.description
        "E-Legion"
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Plugin for good start"
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
