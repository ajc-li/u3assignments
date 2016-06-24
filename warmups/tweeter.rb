class Tweeter
  def initialize
  	@tweets = []
  end

  def tweet(message)
  	@tweets << message
  end

  def each (&block)
  	@tweets.each do |tweet|
  		block.call(tweet)
  	end
  end
end

t = Tweeter.new

t.tweet("first message")
t.tweet("second message")

t.each {|msg| puts msg}

t.map {|msg| puts msg.upcase}