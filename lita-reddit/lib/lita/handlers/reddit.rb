module Lita
  module Handlers
    class Reddit < Handler
      
      require 'snoo'

      route(/(reddit)(\s)(.*)/ :reddit_image($3))

      def reddit_image(subreddit)
        reddit = Snoo::Client.new
        reddit.log_in 'Litabot', 'admin'
        puts + reddit.get_listing(subreddit: ARGV[0])['data']['children'][rand(25)]['data']['url']
      end
    end

    Lita.register_handler(Reddit)
  end
end