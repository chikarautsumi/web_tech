require 'webrick'
server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
server.mount('/test', WEBrick::HTTPServlet::ERBHandler, 'test.html.erb')
server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')
server.mount('/goya_zikashouhi.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya_zikashouhi.rb')
server.mount('/goya_lowquality.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya_lowquality.rb')
server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'new.html.erb')
server.start