
### START BOILERPLATE CODE

# Sample Ruby code for user authorization

require 'rubygems'
gem 'google-api-client', '>0.7'
require 'google/apis'
require 'google/apis/youtube_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'

require 'fileutils'

require 'rubygems'
require 'json'



# REPLACE WITH VALID REDIRECT_URI FOR YOUR CLIENT
REDIRECT_URI = 'http://localhost:3000/auth/google_oauth2/callback'
APPLICATION_NAME = 'YouTube Data API Ruby Tests'

# REPLACE WITH NAME/LOCATION OF YOUR client_secrets.json FILE
CLIENT_SECRETS_PATH = 'client_secret.json'

# REPLACE FINAL ARGUMENT WITH FILE WHERE CREDENTIALS WILL BE STORED
CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                             "youtube-ruby-snippet-tests.yaml")

# SCOPE FOR WHICH THIS SCRIPT REQUESTS AUTHORIZATION
SCOPE = Google::Apis::YoutubeV3::AUTH_YOUTUBE_FORCE_SSL

def authorize
  FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

  client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
  token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
  authorizer = Google::Auth::UserAuthorizer.new(
  client_id, SCOPE, token_store)
  user_id = 'default'
  credentials = authorizer.get_credentials(user_id)
  if credentials.nil?
    url = authorizer.get_authorization_url(base_url: REDIRECT_URI)
    puts "Open the following URL in the browser and enter the " +
         "resulting code after authorization"
    puts url
    code = gets
    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: REDIRECT_URI)
  end
  credentials
end

# Initialize the API
service = Google::Apis::YoutubeV3::YouTubeService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization = authorize

# Print response object as JSON
def print_results(response)
  puts response.to_json
end



## END BOILERPLATE CODE

# Sample ruby code for playlistItems.list, in order to get all liked videos

def playlist_items_list_by_playlist_id(service, part, **params)

    params = params.delete_if { |p, v| v == ''}
  response = service.list_playlist_items(part, params)
    # print_results(response)
  
end


playlist_items_list_by_playlist_id(
  service, 'snippet',
  max_results: 50,
  playlist_id: 'LLkyneo6XAv1no1jH33K2Bmg',
    )

# Code to an array with all video id in the format expected by the medtho def videos multiples ids, the format is id: 'DTTwp6J47Sw, xSY75qJ_kIk')

file = File.read('res.json')

data = JSON.parse(file)
# # to get videoid
# vuid = data["items"].map { |item| item["snippet"]["resourceId"]["videoId"] }


# or to get title 
vuid = data["items"].map { |item| item["snippet"]["title"]}

vid = vuid.join(', ')
puts vid
  

  # Sample ruby code for videos.list, in order to get tags and categoryId for a specific video

# def videos_list_multiple_ids(service, part, **params)
#   params = params.delete_if { |p, v| v == ''}
#   response = service.list_videos(part, params)
#   print_results(response)
# end




# videos_list_multiple_ids(service, 'snippet',
#   id: vid)