# frozen_string_literal: true

require_relative "lib/libre_translate/version"

Gem::Specification.new do |spec|
  spec.name = "libretranslate"
  spec.version = LibreTranslate::VERSION
  spec.authors = ["Sébastien Gaya", "Arnaud Levy"]
  spec.email = ["sebastien.gaya@gmail.com", "arnaud.levy@noesya.coop"]

  spec.summary = "Ruby wrapper to communicate with LibreTranslate API."
  spec.description = "Ruby wrapper to communicate with LibreTranslate API."
  spec.homepage = "https://github.com/noesya/libretranslate"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/noesya/libretranslate/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "json"
  spec.add_dependency "net-http"
  spec.add_dependency "open-uri"

  spec.add_development_dependency "byebug"
end
