# frozen_string_literal: true

require_relative "libre_translate/version"

module LibreTranslate
  class << self
    # Base URL of the LibreTranslate API provider.
    attr_writer :base_url
    def base_url
      @base_url ||= "https://libretranslate.com"
    end

    # API key to use in LibreTranslate API requests.
    attr_writer :api_key
    def api_key
      @api_key ||= ""
    end
  end

  def self.configure
    yield self
  end
end
