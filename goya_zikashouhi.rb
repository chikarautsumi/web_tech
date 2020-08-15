require 'cgi'
cgi = CGI.new

cgi.out("type" => "text/html", "charset" => "UTF-8") {
  get = cgi['goya_zikashouhi']
  "<html>
    <body>
      <p>譲渡先が自家消費ではないもののgoyaの情報</p>
        #{get}
    </body>
  </html>"
}