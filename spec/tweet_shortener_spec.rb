require 'spec_helper'
require 'pry'

describe 'tweet shortener' do

  let(:tweet_one)   {"Hey guys, can anyone teach me how to be cool? I really want to be the best at everything, you know what I mean? Tweeting is super fun you guys!!!!"}
  let(:tweet_two)   {"OMG you guys, you won't believe how sweet my kitten is. My kitten is like super cuddly and too cute to be believed right?"}
  let(:tweet_three) {"GUISEEEEE this is so fun! I'm tweeting for you guys and this tweet is SOOOO long it's gonna be way more than you would think twitter can handle, so shorten it up you know what I mean? I just can never tell how long to keep typing!"}
  let(:tweet_four)  {"New game. Middle aged tweet followed by #youngPeopleHashTag Example: Gotta get my colonoscopy and mammogram soon. Prevention is key! #swag"}
  let(:tweet_five)  {"I'm running out of example tweets for you guys, which is weird, because I'm a writer and this is just writing and I tweet all day. For real, you guys. For real."}

  let(:tweet_one_short)   {"Hey guys, can anyone teach me how 2 b cool? I really want 2 b the best @ everything, u know what I mean? Tweeting is super fun u guys!!!!"}
  let(:tweet_two_short)   {"OMG u guys, u won't believe how sweet my kitten is. My kitten is like super cuddly & 2 cute 2 b believed right?"}
  let(:tweet_three_short) {"GUISEEEEE this is so fun! I'm tweeting 4 u guys & this tweet is SOOOO long it's gonna b way more than u would think twitter can handle, so shorten it up u know what I mean? I just can never tell how long 2 keep typing!"}
  let(:tweet_four_short)  {"New game. Middle aged tweet followed by #youngPeopleHashTag Example: Gotta get my colonoscopy & mammogram soon. Prevention is key! #swag"}
  let(:tweet_five_short)  {"I'm running out of example tweets 4 u guys, which is weird, because I'm a writer & this is just writing & I tweet all day. 4 real, u guys. 4 real."}

  let(:tweets) {[tweet_one, tweet_two, tweet_three, tweet_four, tweet_five]}

  # Question 1
  describe '#word_substituter' do
    it 'replaces long words with their expected short form' do
      expect(word_substituter(tweet_one)).to eq(tweet_one_short)
    end
  end

  # Question 2
  describe '#bulk_tweet_shortener' do
    it 'shortens each tweet and prints the results' do
      expect($stdout).to receive(:puts).with(tweet_one_short)
      expect($stdout).to receive(:puts).with(tweet_two_short)
      expect($stdout).to receive(:puts).with(tweet_three_short)
      expect($stdout).to receive(:puts).with(tweet_four_short)
      expect($stdout).to receive(:puts).with(tweet_five_short)
      bulk_tweet_shortener(tweets)
    end
  end

  # Question 3
  describe '#selective_tweet_shortener' do
    it "shortens tweets that are more than 140 characters" do
      tweet_one_length = tweet_one.length
      tweet_three_length = tweet_three.length
      tweet_five_length = tweet_five.length
      expect(selective_tweet_shortener(tweet_one).length).to be < tweet_one_length
      expect(selective_tweet_shortener(tweet_three).length).to be < tweet_three_length
      expect(selective_tweet_shortener(tweet_five).length).to be < tweet_five_length
    end

    it "does not shorten tweets that are less than 130 characters" do
      expect(selective_tweet_shortener(tweet_two).length).to be == tweet_two.length
      expect(selective_tweet_shortener(tweet_four).length).to be == tweet_four.length
    end

  end

  # Question 4
  describe '#shortened_tweet_truncator' do
    it 'truncates tweets over 140 characters after shortening' do
      expect(shortened_tweet_truncator(tweet_three).length).to be == 140
    end

    it 'does not shorten tweets shorter than 140 characters.' do
      expect(shortened_tweet_truncator(tweet_one_short).length).to be == tweet_one_short.length
    end
  end

end
