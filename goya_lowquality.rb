require 'cgi'
cgi = CGI.new

cgi.out("type" => "text/html", "charset" => "UTF-8") {
  get = cgi['goya_lowquality']
  "<html>
    <body>
      <p>品質が悪いもの（false）のgoyaの情報</p>
        #{get}
    </body>
  </html>"
}