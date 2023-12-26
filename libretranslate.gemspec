# frozen_string_literal: true

require_relative "lib/libretranslate/version"

Gem::Specification.new do |spec|
  spec.name = "libretranslate"
  spec.version = Libretranslate::VERSION
  spec.authors = ["Sébastien Gaya"]
  spec.email = ["sebastien.gaya@gmail.com"]

  spec.summary = "Ruby gem to communicate with LibreTranslate API."
  spec.description = "Ruby gem to communicate with LibreTranslate API."
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

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
end
