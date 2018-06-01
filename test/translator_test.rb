require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator'

class TranslatorTest < Minitest::Test

  def setup
    @translator = Translator.new
  end

  def test_it_exists
    assert_instance_of Translator, @translator
  end

  def test_it_can_do_eng_to_morse
    assert_equal "......-...-..--- .-----.-..-..-..", @translator.eng_to_morse("hello world")
  end

  def test_it_can_translate_case_insensitive_and_with_numbers
    assert_equal "......-...-..--- .-----.-..-..-..", @translator.eng_to_morse("Hello World")
    assert_equal "-......-.. .-.-.. ...-- ..........--....", @translator.eng_to_morse("There are 3 ships")
  end

  def test_it_can_translate_from_a_file
    assert_equal ".. .--- ..-. .- ..-....-...", @translator.from_file("input.txt")
  end

  def test_it_can_do_morse_to_eng
    assert_equal "hello world", @translator.morse_to_eng(".... . .-.. .-.. ---  .-- --- .-. .-.. -..")
  end

end
