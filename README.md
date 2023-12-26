# LibreTranslate

[![Gem Version](https://badge.fury.io/rb/libretranslate.svg)](https://badge.fury.io/rb/libretranslate)

Ruby wrapper to communicate with [LibreTranslate](https://libretranslate.com) API.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add libretranslate

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install libretranslate

If you're working on a Ruby on Rails application, generate the initializer to set your configuration:

    $ rails generate libretranslate:install

Else, add the following in your code and modify it to your configuration:

```rb
require "libretranslate"

LibreTranslate.configure do |config|
  config.base_url = "https://libretranslate.com"
  config.api_key = ""
end
```

## Usage

### Detect the language of a single text

```rb
LibreTranslate.detect("Hello world!")
```

### Translate text from one language to another

```rb
# With source and target languages
LibreTranslate.translate("Hello world!", source: "en", target: "fr")
# With source detection
LibreTranslate.translate("Hello world!", source: "auto", target: "fr")
# With HTML
LibreTranslate.translate("Hello <b>world</b>!", source: "en", target: "fr", format: "html")
```

### Recover the list of supported languages

```rb
LibreTranslate.languages
```

### Recover interface-specific settings

```rb
LibreTranslate.frontend_settings
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/noesya/libretranslate. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/noesya/libretranslate/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Libretranslate project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/noesya/libretranslate/blob/main/CODE_OF_CONDUCT.md).
