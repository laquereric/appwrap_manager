Feature: AppwrapManager Rake Tasks
  As a Rails developer
  I want to use appwrap_manager rake tasks
  So that I can extract all routes, models, and tests in one command

  Background:
    Given I have a Rails application with appwrap_manager installed

  Scenario: Extract all data using extract_all task
    When I run the rake task "appwrap:manager:extract_all"
    Then the appwrap directory should be created
    And routes should be extracted to "appwrap/routes.jsonl"
    And models should be extracted to "appwrap/models.jsonl"
    And tests should be extracted to "appwrap/tests.jsonl"

  Scenario: Run all tests using test_all task
    Given I have extracted tests in "appwrap/tests.jsonl"
    When I run the rake task "appwrap:manager:test_all"
    Then a test run directory should be created under "appwrap/testrun"
    And a test run summary should be generated

  Scenario: Manager only writes to appwrap folder
    When I run the rake task "appwrap:manager:extract_all"
    Then no files should be created outside the appwrap directory

