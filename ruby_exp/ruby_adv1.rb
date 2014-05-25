
#block

def call_this_block_twice
	yield
	yield
end

call_this_block_twice  { puts "tweets" }

#output => tweets tweets


# What if we want to store this block , for execution later ?
# that's where Proc come into picture !

my_proc = Proc.new {puts "tweets"}
my_proc.call


#Another way to store block's , is lambda , but technicall both are not same thing


my_proc = lambda {puts "tweets"}
my_proc.call

#OR
#Ruby 1.9 or later 

my_proc = -> {puts "tweets"}
my_proc.call


#block ==> lamda
#example

#using block

class Tweet
	def post
		if authenticate(@user,@password)
			yield
	    else
	    	raise "Auth Error!"
	    end
	end
end

tweet = Tweet.new("Ruby Bits")
tweet.post {puts "Sent"}

#using lambda


class Tweet
	def post(sucess)
		if authenticate(@user,@password)
			sucess.call
	    else
	    	raise "Auth Error!"
	    end
	end
end

tweet = Tweet.new("Ruby Bits")
sucess = -> {puts "Sent"}
tweet.post(sucess)


##more refactor

class Tweet
	def post(sucess,error)
		if authenticate(@user,@password)
			sucess.call
	    else
	    	error.call
	    end
	end
end

tweet = Tweet.new("Ruby Bits")
sucess = -> {puts "Sent"}
error = -> {puts "Auth Error!"}
tweet.post(sucess,error)


###lambda to block


tweets.each do |tweet|
	puts tweet
end


#turn proc to block
printer = lambda { |tweet| puts tweet }
tweets.each(&printer)











