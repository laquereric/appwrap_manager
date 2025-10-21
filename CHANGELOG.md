# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2025-10-20

### Added
- Initial release of appwrap_manager gem
- Rake task `appwrap:manager:extract_all` to extract routes, models, and tests
- Rake task `appwrap:manager:test_all` to run all tests using testrunner
- Integration with appwrap_routes, appwrap_models, appwrap_tests, and appwrap_testrunner
- Comprehensive RSpec and Cucumber test coverage
- MIT License
- README with usage instructions

### Features
- Unified interface for all appwrap gems
- Write-only to appwrap folder guarantee
- Structured JSON output for test runs
- Rails Railtie integration for automatic task loading

