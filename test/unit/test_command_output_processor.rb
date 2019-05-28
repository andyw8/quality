# frozen_string_literal: true

require_relative 'test_helper'

# Test the CommandOutputProcessor class
class TestCommandOutputProcessor < MiniTest::Test
  def test_process_vanilla
    @processor = get_test_object
    @processor.file = vanilla_file
    @processor.process do
      0
    end
  end

  def vanilla_file
    file_content = <<~TEST
      foo
      bar
      baz
    TEST
    StringIO.new(file_content)
  end

  def test_process_with_emacs
    @processor = get_test_object
    @processor.file = vanilla_file
    @processor.emacs_format = true
    @processor.process do
      0
    end
  end

  def get_test_object(&twiddle_mocks)
    yield unless twiddle_mocks.nil?
    Quality::CommandOutputProcessor.new
  end
end
