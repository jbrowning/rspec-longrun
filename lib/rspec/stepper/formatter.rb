require "rspec/core/formatters/base_text_formatter"

module RSpec
  module Stepper

    class Formatter < RSpec::Core::Formatters::BaseTextFormatter

      def initialize(output)
        super(output)
        @indent_level = 0
      end

      def example_group_started(example_group)
        super(example_group)
        emit(example_group.description.strip)
        indent!
      end

      def example_group_finished(example_group)
        super(example_group)
        outdent!
      end

      def example_started(example)
        super(example)
        emit(example.description.strip)
        indent!
      end

      def example_passed(example)
        super(example)
        outdent!
        emit(green("* PASSED"))
      end

      def example_pending(example)
        super(example)
        outdent!
      end

      def example_failed(example)
        super(example)
        outdent!
      end

      private

      def indent!
        @indent_level += 1
      end

      def outdent!
        @indent_level -= 1
      end

      def emit(message)
        output.puts(message.gsub(/^/, current_indentation))
      end

      def current_indentation
        '  ' * @indent_level
      end

    end

  end
end
