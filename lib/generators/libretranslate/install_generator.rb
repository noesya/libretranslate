# frozen_string_literal: true

require 'rails/generators/base'

module Libretranslate
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a LibreTranslate initializer."

      def copy_initializer
        template "libretranslate.rb", "config/initializers/libretranslate.rb"
      end
    end
  end
end