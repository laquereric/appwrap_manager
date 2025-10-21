'''# AppwrapManager

[![Gem Version](https://badge.fury.io/rb/appwrap_manager.svg)](https://badge.fury.io/rb/appwrap_manager)
[![Build Status](https://travis-ci.org/laquereric/appwrap_manager.svg?branch=main)](https://travis-ci.org/laquereric/appwrap_manager)

**AppwrapManager** is a Ruby gem that serves as a centralized management tool for the Appwrap suite of gems. It provides a unified interface to extract routes, models, and tests from a Rails application, and to run all tests using a dedicated test runner. The core design principle of the Appwrap suite is to be write-only to the `appwrap` folder, ensuring that your application's codebase remains untouched.

This gem wraps the following gems from the [laquereric GitHub repository](https://github.com/laquereric):

*   `appwrap_routes`
*   `appwrap_models`
*   `appwrap_tests`
*   `appwrap_testrunner`

## Features

*   **Unified Rake Tasks**: Provides single commands to perform complex operations across the Appwrap suite.
*   **Comprehensive Extraction**: Extracts routes, models (including columns, associations, and validations), and tests (RSpec, Minitest, Cucumber) into a structured format.
*   **Isolated Output**: Strictly adheres to writing all output to the `appwrap` directory within your Rails application.
*   **Test Execution**: Includes a rake task to run all extracted tests through the `appwrap_testrunner`.
*   **Seamless Rails Integration**: Automatically loads rake tasks into your Rails application through a Railtie.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'appwrap_manager', git: 'https://github.com/laquereric/appwrap_manager'
```

And then execute:

```shell
$ bundle install
```

## Usage

AppwrapManager provides two primary rake tasks to manage your application's metadata.

### Extracting All Information

To extract all routes, models, and tests from your Rails application, run the following rake task:

```shell
$ rake appwrap:manager:extract_all
```

This command will perform the following actions:

1.  Create an `appwrap` directory in your Rails root if it doesn't already exist.
2.  Invoke `appwrap:routes:extract` to generate `appwrap/routes.jsonl`.
3.  Invoke `appwrap:models:extract` to generate `appwrap/models.jsonl`.
4.  Invoke `appwrap:tests:extract` to generate `appwrap/tests.jsonl`.

### Running All Tests

To run all the tests that have been extracted, use the `test_all` task:

```shell
$ rake appwrap:manager:test_all
```

This command will:

1.  Check for the existence of `appwrap/tests.jsonl`. If the file is not found, it will automatically run the `appwrap:tests:extract` task first.
2.  Read the `tests.jsonl` file to get a list of all tests.
3.  Create a unique test run directory under `appwrap/testrun/`.
4.  (In a future version) Execute each test using the `appwrap_testrunner`.
5.  Generate a `test_run_summary.json` file in the test run directory with the results of the test run.

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rake spec` to run the RSpec tests and `rake cucumber` to run the Cucumber tests. You can also run `rake` to run both test suites.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `lib/appwrap_manager/version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/laquereric/appwrap_manager](https://github.com/laquereric/appwrap_manager). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AppwrapManager project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/laquereric/appwrap_manager/blob/main/CODE_OF_CONDUCT.md).
'''
