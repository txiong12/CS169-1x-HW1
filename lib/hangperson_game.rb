class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  
  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses
  
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

  def guess(new_guess)
    
    raise ArgumentError if new_guess.nil?
    raise ArgumentError if new_guess.empty?
    raise ArgumentError if new_guess =~ /[^a-zA-Z]+/
    
    new_guess.downcase!
    
    if (!@guesses.include? new_guess) && (!@wrong_guesses.include? new_guess)
      if @word.include? new_guess
        @guesses << new_guess
        return true
      else
        @wrong_guesses << new_guess
        return true
      end
    end
    return false
    
  end
  
end
