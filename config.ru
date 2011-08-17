require './application'
Cchat::Application.initialize!

# Development middlewares
if Cchat::Application.env == 'development'
  use AsyncRack::CommonLogger

  # Enable code reloading on every request
  # use Rack::Reloader, 0

  # Serve assets from /public
  use Rack::Static, :urls => ["/javascripts","/index.html"], :root => Cchat::Application.root(:public)
end

# Running thin :
#
#   bundle exec thin --max-persistent-conns 1024 --timeout 0 -R config.ru start
#
# Vebose mode :
#
#   Very useful when you want to view all the data being sent/received by thin
#
#   bundle exec thin --max-persistent-conns 1024 --timeout 0 -V -R config.ru start
#
run Cchat::Application.routes
