class Translator

  def initialize
    @dictionary = {"a" => ".-",
                    "b" => "-...",
                    "c" => "-.-.",
                    "d" => "-..",
                    "e" => ".",
                    "f" => "..-.",
                    "g" => "--.",
                    "h" => "....",
                    "i" => "..",
                    "j" => ".---",
                    "k" => "-.-",
                    "l" => ".-..",
                    "m" => "--",
                    "n" => "-.",
                    "o" => "---",
                    "p" => ".--.",
                    "q" => "--.-",
                    "r" => ".-.",
                    "s" => "...",
                    "t" => "-",
                    "u" => "..-",
                    "v" => "...-",
                    "w" => ".--",
                    "x" => "-..-",
                    "y" => "-.--",
                    "z" => "--..",
                    "1" => ".----",
                    "2" => "..---",
                    "3" => "...--",
                    "4" => "....-",
                    "5" => ".....",
                    "6" => "-....",
                    "7" => "--...",
                    "8" => "---..",
                    "9" => "----.",
                    "0" => "-----",
                    " " => " "}
  end

  def eng_to_morse(message)
    message = message.downcase.chars
    encoded = message.map { |char| @dictionary[char] }
    encoded.join
  end

  def from_file(contents)
    file = File.open(contents, 'r')
    message = file.read.chomp
    file.close
    eng_to_morse(message)
  end

  def morse_to_eng(message)
    message_words = message.split('  ')
    message_split = message_words.map { |word| word.split(' ') }
    msg_w_spaces = message_split.map { |word| word << " " }
    decoded_words = message_split.map do |word|
      decoded = word.map { |char| @dictionary.key(char) }
    end
    decoded_words[-1].pop
    decoded_words.join
  end

end
