=begin

Good Code Vs Bad Code
by saurabh

=end

#bad code

if !tweets.empty?
	puts "Timeline"
	puts "Tweets"
end


#Good code

unless tweets.empty?
	puts "Timeline"
	puts "Tweets"
end


######################

#unless with else
#bad code

unless tweets.empty?
	puts "Timeline"
	puts "Tweets"
else
	puts "No Tweets found !"
end

#Good code

if tweets.empty?
	puts "No Tweets found !"
else
	puts "Timeline"
	puts "Tweets"
end


######################

# in Ruby nil is considered as false
#bad code

if attachment.file_path != nil
  attachment.post
end


#Good code
if attachment.file_path
  attachment.post
end


######################

# some ruby unual fact's
# ""->true , 0-->true and [] -->true

#bad practice , warn will never get executed !

unless name.length
	warn "User name is required"
end


######################


#bad code

if password.length < 8
	warn "password is too short"
end
unless username
  fail "No username is set"
end

#Good code
### inline conditionals ,more readble

warn "password is too short" if password.length < 8
fail "No username is set" unless username



######################

#Bad code

if user
  if user.signed_in?
  ....
  end
end


#Good Code , SHort-Circuit

if user && user.signed_in?
	....
end


######################

#Bad code

tweets = Timeline.tweets
tweets = [] unless tweets


#Good code

tweets = Timeline.tweets || []

######################



#short-circuit evaluation

def sign_in
	current_session || sign_user_in
end


######################


#bad code

options[:country]='us' if options[:country].nil?

#Good code

options[:country] ||='us'

######################



#bad code

if list_name
  options[:path] = "/#{username}/#{list_name}"
else
  options[:path] = "/#{username}"
end

#Good code
#In ruby,Conditional returm values

options[:path] if list_name
  "/#{username}/#{list_name}"
 else
 "/#{username}"
end


######################

#case statement

client_url = case client
  when "web"
    "http://twitter.com"
  when "Facebook"
    "http://facebook/twitter"
  else
    nil
end 


#case ranges

popularity = case tweets.retweet_count
	when 0..9
		nil
	when 10..99
		"trending"
	else
		"hot"
end
















