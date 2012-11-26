require 'rspec/core'
require 'rspec/core/example'
require 'rspec/core/example_group'
require 'rspec/core/formatters/base_formatter'
require 'rspec/core/reporter'

# extend rspec-core with support for "steps"

module RSpec::Core

  class Reporter

    def step_started(description)
      notify :step_started, description
    end

    def step_finished(description)
      notify :step_finished, description
    end

  end

  class Formatters::BaseFormatter

    def step_started(description)
    end

    def step_finished(description)
    end

  end

  class Example

    private

    alias :start_without_reporter :start

    def start(reporter)
      start_without_reporter(reporter)
      @example_group_instance.instance_variable_set(:@_rspec_reporter, reporter)
    end

  end

end
