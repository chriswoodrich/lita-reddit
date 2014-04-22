module Lita
  module Handlers
    class Reddit < Handler
      
      require 'snoo'

      route(/reddit\s+(?<sub>\w+)\s*(?<n>\d+)?/i, :reddit_image, command: true)
      #n will be a numbered argument to be used in more complex requests
      def reddit_image
        sub, n = response.matches.captures
        n ||= rand(26)
        reddit = Snoo::Client.new
        reddit.log_in 'placeholder', 'placeholder'
        puts + reddit.get_listing(subreddit: sub.to_s)['data']['children'][n.to_i]['data']['url']
      end
    end

    Lita.register_handler(Reddit)
  end
end