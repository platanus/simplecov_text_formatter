# SimpleCov Text Formatter

[![Gem Version](https://badge.fury.io/rb/simplecov_text_formatter.svg)](https://badge.fury.io/rb/simplecov_text_formatter)
[![CircleCI](https://circleci.com/gh/platanus/simplecov_text_formatter.svg?style=shield)](https://app.circleci.com/pipelines/github/platanus/simplecov_text_formatter)

Text formatter for SimpleCov code coverage tool

***Note: To learn more about SimpleCov, check out the main repo at [https://github.com/simplecov-ruby/simplecov](https://github.com/colszowka/simplecov***)***

## Installation

Add to your Gemfile:

```ruby
gem 'simplecov'
gem 'simplecov_text_formatter'
```

```bash
bundle install
```

## Usage

Add the formatter to your `spec/spec_helper.rb`.

```ruby
require 'simplecov'
require 'simplecov_text_formatter'

SimpleCov.start 'rails' do
  # ...

  formatter SimpleCov::Formatter::MultiFormatter.new(
    [
      SimpleCov::Formatter::TextFormatter,
      SimpleCov::Formatter::HTMLFormatter
    ]
  )
end
```

Then run your test and check the file `coverage/coverage.txt`. You'll see something like this:

```
/app/channels/application_cable/channel.rb:1:1: Not covered lines: 1 to 4
/app/channels/application_cable/connection.rb:1:1: Not covered lines: 1 to 4
/app/controllers/api/v1/users_controller.rb:39:1: Not covered lines: 39
/app/controllers/application_controller.rb:17:1: Not covered lines: 17
/app/controllers/home_controller.rb:1:1: Not covered lines: 1 to 5
/app/controllers/organizations_controller.rb:1:1: Not covered lines: 1 and 2
/app/controllers/organizations_controller.rb:4:1: Not covered lines: 4 to 6
/app/controllers/organizations_controller.rb:8:1: Not covered lines: 8 to 13
/app/controllers/organizations_controller.rb:15:1: Not covered lines: 15
/app/controllers/organizations_controller.rb:17:1: Not covered lines: 17 to 20
/app/controllers/teams_controller.rb:1:1: Not covered lines: 1 and 2
/app/controllers/teams_controller.rb:4:1: Not covered lines: 4 to 6
/app/controllers/teams_controller.rb:8:1: Not covered lines: 8 to 11
/app/controllers/teams_controller.rb:13:1: Not covered lines: 13
/app/controllers/teams_controller.rb:15:1: Not covered lines: 15 to 18
/app/controllers/users_controller.rb:13:1: Not covered lines: 13
/app/controllers/users_controller.rb:17:1: Not covered lines: 17 and 18
/app/controllers/users_controller.rb:28:1: Not covered lines: 28
/app/jobs/application_job.rb:1:1: Not covered lines: 1
/app/jobs/application_job.rb:7:1: Not covered lines: 7
/app/models/user.rb:17:1: Not covered lines: 17
/app/policies/active_admin/comment_policy.rb:1:1: Not covered lines: 1 and 2
/app/policies/active_admin/page_policy.rb:1:1: Not covered lines: 1 to 5
/app/policies/admin_user_policy.rb:1:1: Not covered lines: 1 and 2
/app/policies/application_policy.rb:1:1: Not covered lines: 1 and 2
/app/policies/application_policy.rb:4:1: Not covered lines: 4 to 7
/app/policies/application_policy.rb:9:1: Not covered lines: 9 to 11
/app/policies/application_policy.rb:13:1: Not covered lines: 13 to 15
/app/policies/application_policy.rb:17:1: Not covered lines: 17 to 19
/app/policies/application_policy.rb:21:1: Not covered lines: 21 to 23
/app/policies/application_policy.rb:25:1: Not covered lines: 25 to 27
/app/policies/application_policy.rb:29:1: Not covered lines: 29 to 31
/app/policies/application_policy.rb:33:1: Not covered lines: 33 to 35
/app/policies/application_policy.rb:37:1: Not covered lines: 37 and 38
/app/policies/application_policy.rb:40:1: Not covered lines: 40 to 43
/app/policies/application_policy.rb:45:1: Not covered lines: 45 to 47
/app/policies/application_policy.rb:49:1: Not covered lines: 49 to 52
/app/policies/application_policy.rb:54:1: Not covered lines: 54 to 57
/app/policies/organization_policy.rb:1:1: Not covered lines: 1 and 2
/app/policies/team_member_policy.rb:1:1: Not covered lines: 1 and 2
/app/policies/team_policy.rb:1:1: Not covered lines: 1 and 2
/app/policies/user_policy.rb:1:1: Not covered lines: 1 and 2
/app/uploaders/base_uploader.rb:9:1: Not covered lines: 9
/engines/dynattributes/app/commands/dynattributes/validate_date_attribute.rb:4:1: Not covered lines: 4
/engines/dynattributes/app/commands/dynattributes/validate_date_time_attribute.rb:4:1: Not covered lines: 4
/engines/dynattributes/app/commands/dynattributes/validate_select_definition.rb:4:1: Not covered lines: 4
/engines/dynattributes/app/models/dynattributes/instance.rb:13:1: Not covered lines: 13 and 14
/engines/dynattributes/app/models/dynattributes/instance.rb:16:1: Not covered lines: 16
/engines/dynattributes/lib/dynattributes.rb:21:1: Not covered lines: 21
/engines/tasks/lib/tasks.rb:20:1: Not covered lines: 20
```

## Testing

To run the specs you need to execute, **in the root path of the gem**, the following command:

```bash
bundle exec guard
```

You need to put **all your tests** in the `/my_gem/spec/` directory.

## Publishing

On master/main branch...

1. Change `VERSION` in `lib/simplecov_text_formatter/version.rb`.
2. Change `Unreleased` title to current version in `CHANGELOG.md`.
3. Run `bundle install`.
4. Commit new release. For example: `Releasing v0.1.0`.
5. Create tag. For example: `git tag v0.1.0`.
6. Push tag. For example: `git push origin v0.1.0`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

Thank you [contributors](https://github.com/platanus/simplecov_text_formatter/graphs/contributors)!

<img src="http://platan.us/gravatar_with_text.png" alt="Platanus" width="250"/>

SimpleCov Text Formatter is maintained by [platanus](http://platan.us).

## License

SimpleCov Text Formatter is © 2021 platanus, spa. It is free software and may be redistributed under the terms specified in the LICENSE file.
