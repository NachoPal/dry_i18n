# DryI18n

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/dry_i18n`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dry_i18n'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dry_i18n

## Usage

With this Gem you'll be able tu reuse i18n key translations, avoiding in this way to repeat yourself.

Basically you just need to wrap the key you want to reuse with the markup **@[key]**

If the key you are reusing has interpolations, you just need to add a coma and pass a hash with the interpolation values **@[key,{foo: 'foo', bar: 'bar'}]**

###Some examples of use:

1.- Basic reuse
```
en:
    secondary_key: "secondary key"
    main_key: "I am a main key which reuse a @[secondary_key]"
```
```
I18n.t("main_key") = "I am a main key which reuse a secondary_key"
```

2.- Reusing with interpolation
```
en:
    secondary_key: "secondary key with %{interpolation}"
    main_key: "I am a main key which reuse a @[secondary_key,{interpolation: 'interpolation'}]"
```
```
I18n.t("main_key") = "I am a main key which reuse a secondary_key with interpolation"
```

3.- Reusing with nested keys with or without interpolation
```
en:
    nth_key: "nested key with %{interpolation}"
    secondary_key: "secondary key with %{interpolation} and a @[nth_key,{interpolation: 'interpolation'}]"
    main_key: "I am a main key which reuse a @[secondary_key,{interpolation: 'interpolation'}], and it's own %{interpolation}"
```
```
I18n.t("main_key",{interpolation: 'interpolation'}) =
"I am a main key which reuse a secondary_key with interpolation and a nested key with interpolaton, and it's own interpolation"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/NachoPal/dry_i18n.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

