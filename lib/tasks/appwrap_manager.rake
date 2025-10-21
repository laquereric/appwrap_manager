# frozen_string_literal: true

namespace :appwrap do
  namespace :manager do
    desc "Extract all routes, models, and tests to appwrap folder"
    task extract_all: :environment do
      puts "=" * 80
      puts "AppwrapManager: Extracting all routes, models, and tests"
      puts "=" * 80
      puts ""

      # Ensure appwrap directory exists
      appwrap_dir = Rails.root.join("appwrap")
      FileUtils.mkdir_p(appwrap_dir) unless Dir.exist?(appwrap_dir)

      # Extract routes
      puts "→ Extracting routes..."
      begin
        Rake::Task["appwrap:routes:extract"].invoke
        puts "✓ Routes extracted successfully"
      rescue StandardError => e
        puts "✗ Failed to extract routes: #{e.message}"
      end
      puts ""

      # Extract models
      puts "→ Extracting models..."
      begin
        Rake::Task["appwrap:models:extract"].invoke
        puts "✓ Models extracted successfully"
      rescue StandardError => e
        puts "✗ Failed to extract models: #{e.message}"
      end
      puts ""

      # Extract tests
      puts "→ Extracting tests..."
      begin
        Rake::Task["appwrap:tests:extract"].invoke
        puts "✓ Tests extracted successfully"
      rescue StandardError => e
        puts "✗ Failed to extract tests: #{e.message}"
      end
      puts ""

      puts "=" * 80
      puts "Extraction complete! All data written to: #{appwrap_dir}"
      puts "=" * 80
    end

    desc "Run all tests using appwrap testrunner"
    task test_all: :environment do
      require "json"
      require "securerandom"

      puts "=" * 80
      puts "AppwrapManager: Running all tests"
      puts "=" * 80
      puts ""

      # First, ensure tests are extracted
      tests_file = Rails.root.join("appwrap", "tests.jsonl")
      unless File.exist?(tests_file)
        puts "→ Tests not found. Extracting tests first..."
        Rake::Task["appwrap:tests:extract"].invoke
        puts ""
      end

      # Read all tests from tests.jsonl
      tests = []
      if File.exist?(tests_file)
        File.readlines(tests_file).each do |line|
          tests << JSON.parse(line.strip)
        end
      end

      if tests.empty?
        puts "No tests found to run."
        return
      end

      puts "Found #{tests.count} test(s) to run"
      puts ""

      # Create a test run directory
      test_run_uuid = "manager-run-#{SecureRandom.uuid}"
      test_run_dir = Rails.root.join("appwrap", "testrun", test_run_uuid)
      FileUtils.mkdir_p(test_run_dir)

      # Run each test using the testrunner
      results = {
        total: tests.count,
        passed: 0,
        failed: 0,
        errors: 0,
        test_run_uuid: test_run_uuid,
        started_at: Time.now.utc.iso8601,
        tests: []
      }

      tests.each_with_index do |test, index|
        puts "→ Running test #{index + 1}/#{tests.count}: #{test['description']}"
        
        begin
          # For now, we'll create a simple test result
          # In a real implementation, this would invoke the actual test
          test_uuid = test["uuid"]
          
          # Simulate test execution
          # In production, this would call: Rake::Task["appwrap:testrunner:run"].invoke(test_uuid)
          
          test_result = {
            uuid: test_uuid,
            description: test["description"],
            type: test["type"],
            file_path: test["file_path"],
            status: "pending", # Would be 'passed', 'failed', or 'error' in real execution
            message: "Test execution not yet implemented in manager"
          }
          
          results[:tests] << test_result
          puts "  ⊙ Test marked as pending (execution framework not yet connected)"
        rescue StandardError => e
          results[:errors] += 1
          results[:tests] << {
            uuid: test["uuid"],
            description: test["description"],
            status: "error",
            error: e.message
          }
          puts "  ✗ Error: #{e.message}"
        end
        puts ""
      end

      results[:completed_at] = Time.now.utc.iso8601
      results[:duration_seconds] = (Time.parse(results[:completed_at]) - Time.parse(results[:started_at])).round(2)

      # Write results summary
      summary_file = test_run_dir.join("test_run_summary.json")
      File.write(summary_file, JSON.pretty_generate(results))

      puts "=" * 80
      puts "Test run complete!"
      puts "Total tests: #{results[:total]}"
      puts "Passed: #{results[:passed]}"
      puts "Failed: #{results[:failed]}"
      puts "Errors: #{results[:errors]}"
      puts "Pending: #{results[:total] - results[:passed] - results[:failed] - results[:errors]}"
      puts ""
      puts "Results written to: #{test_run_dir}"
      puts "=" * 80
    end
  end
end

