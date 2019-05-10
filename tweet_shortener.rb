# Write your code here.
require "pry"

def format_word(word)
  word = word.downcase.gsub(/[^a-z0-9\s]/i, '')
  #binding.pry
end

def format_separated(separated_string)
  formatted_string = []
  separated_string.each do |word|
    formatted_string.push(format_word(word))
  end
  #binding.pry
  formatted_string
end

def separate_tweet(tweet)
  separated_tweet = tweet.split(" ")
  #format_separated_tweet = format_separated(separated_tweet)
  #binding.pry
  separated_tweet
end

def separated_tweet_to_s(separate)
  separate.join(" ")
end

def compare_tweet_and_dictionary(tweet, dictionary)
  separated_tweet = separate_tweet(tweet)
  #binding.pry
  new_tweet = []
  separated_tweet.each do |word|
    #binding.pry
    dictionary.each do |key, substitute|
      if word.downcase == key
        word = substitute
      end
    end
    new_tweet.push(word)
  end
  #binding.pry
  separated_tweet_to_s(new_tweet)
end

def get_length(string)
  string.length
  #binding.pry
end

def truncate_at(string, max)
  truncated_string = ''
  char_string = string.chars
  counter = 0
  while counter < max
    truncated_string += char_string[counter]
    counter += 1
  end
  truncated_string
end

def dictionary(tweet)
  shorteners = {
    "hello" => 'hi',
    "to" => '2',
    "two" => '2',
    "too" => '2',
    "four" => '4',
    "for" => '4',
    "be" => 'b',
    "you" => 'u',
    "at" => '@',
    "and" => '&'
  }

  compare_tweet_and_dictionary(tweet, shorteners)
end

def word_substituter(tweet)
  dictionary(tweet)
end

def bulk_tweet_shortener(tweets)
  tweets.each do |tweet|
    shortened_tweet = word_substituter(tweet)
    puts shortened_tweet
  end
end


def selective_tweet_shortener(tweet)
  #binding.pry
    if get_length(tweet) >= 140
      shortened_tweet = word_substituter(tweet)
      shortened_tweet
    else
      tweet
    end
end

def shortened_tweet_truncator(tweet)
  if get_length(tweet) > 140
    shortened_tweet = word_substituter(tweet)
    if get_length(shortened_tweet) > 140
      truncated_tweet = truncate_at(shortened_tweet, 140)
      truncated_tweet
    else
      shortened_tweet
    end
  else
    tweet
  end
end
