# frozen_string_literal: true

require "json"
require "net/http"
require "open-uri"

require_relative "libre_translate/api"
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

  def self.languages
    Api.get("/languages")
  end

  def self.frontend_settings
    Api.get("/frontend/settings")
  end

  def self.detect(text)
    Api.post("/detect", { q: text })
  end

  def self.translate(text, source:, target:, format: "text")
    Api.post("/translate", {
      q: text,
      source: source,
      target: target,
      format: format
    })
  end

  def self.suggest(text, translation, source:, target:)
    Api.post("/suggest", {
      q: text,
      s: translation,
      source: source,
      target: target
    })
  end

  def self.configure
    yield self
  end
end
