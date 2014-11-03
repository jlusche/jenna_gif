require 'sinatra'
require 'httparty'


get '/' do 		#when user goes to route, do erb embeded ruby 
	erb :index
end


get '/results' do   #creates another route/action

    # get the gif query from the user
    @gif_search = params['gif_search']  #stores the search in the url so info can be accessed on other pages


    # replace the spaces with "+" in order to properly build the url
    url_safe_gif = @gif_search.gsub(' ', '+')   #this returns a string

	# create the url, takes string and interpolates into the url search
	url = "http://api.giphy.com/v1/gifs/search?q=#{url_safe_gif}&api_key=dc6zaTOxFJmzC"

	# fetch the response from Giphy
	resp = HTTParty.get(url)    #turns code into json

	gif = resp['data'].sample  #resp came from above line

	@gif_url = gif['images']['fixed_height']['url']

	erb :results
	#@my_gif = list_of_gifs.sample
end



