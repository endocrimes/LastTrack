require 'sinatra'
require 'net/http'
require 'uri'
require 'rss'
def open(url)
  Net::HTTP.get(URI.parse(url))
end

get '/lastfm/lasttrack/:user' do
	rss = RSS::Parser.parse(open('http://ws.audioscrobbler.com/1.0/user/'+params[:user]+'/recenttracks.rss'), false)
	
	rss.items.each { |i| 
	puts "#{i.title}"
	@item = i.title
	break
	}
	"#{@item}"

end