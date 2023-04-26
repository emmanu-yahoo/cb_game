SECRET_NUMBER = 5362
SECRET_LENGTH = 4

def bulls(guess, secret)
  (0..SECRET_LENGTH-1).count { |i| guess[i] == secret[i] }
end

def cows(guess, secret)
  (guess & secret).size - bulls(guess, secret)
end

def get_bulls_cows(secret_num, guess_num)
  secret = secret_num.to_s.chars
  guess = guess_num.to_s.chars
  [bulls(guess, secret), cows(guess, secret)]
end

def valid_guess?(guess)
  guess =~ /^\d{#{SECRET_LENGTH}}$/ && guess.chars.uniq.length == SECRET_LENGTH
end

def play_game
  try_again = true
  while try_again
    guess = gets.chomp
    unless valid_guess?(guess)
      puts "Invalid guess. Please enter a #{SECRET_LENGTH}-digit number without duplicate digits."
      next
    end
    result = get_bulls_cows(SECRET_NUMBER, guess)
    puts result.join(" ")
    break if result[0] == SECRET_LENGTH
  end
end
play_game