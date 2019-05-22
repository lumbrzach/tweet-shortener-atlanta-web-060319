# Write your code here.
require "pry"

def dictionary
  dictionary = {
    "hello" => "hi",
    "to" => "2",
    "two" => "2",
    "too" => "2",
    "for" => "4",
    "four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&"}
end

def word_substituter (tweet)
  array = tweet.split (" ")
  array.map do |words|
    dictionary.each do |og_words, short_words|
      if og_words == words.downcase
        words.replace(short_words)
      end
    end
  end
  #binding.pry
  array.join(" ")
end

def bulk_tweet_shortener (tweets)
  tweets.map do |tweet_content|
    puts word_substituter(tweet_content.to_s)
  end
end

def selective_tweet_shortener(tweet)
    if tweet.length > 140
      word_substituter(tweet)
    else
      return tweet
    end
end

def shortened_tweet_truncator(tweet)
  shortened_tweet = selective_tweet_shortener(tweet)
  if shortened_tweet.length > 140
    shortened_tweet[138..140] = "..."
    return shortened_tweet
  else
    shortened_tweet
  end
end
