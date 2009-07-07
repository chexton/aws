#/usr/bin/ruby

require "cgi"
require "base64"
require "openssl"
require "digest/sha1"
require "uri"
require "net/https"
require "rexml/document"
require "time"

ACCESS_KEY_ID = "--- Replace with your access key id ---"
SECRET_ACCESS_KEY = "--- Replace with your secret access key ---"

action = "UrlInfo"
responseGroup = "Rank"
url = "yahoo.com"

timestamp = ( Time::now ).utc.strftime("%Y-%m-%dT%H:%M:%S.000Z")

signature = Base64.encode64( OpenSSL::HMAC.digest( OpenSSL::Digest::Digest.new( "sha1" ), SECRET_ACCESS_KEY, action + timestamp)).strip

url = URI.parse(

          "http://awis.amazonaws.com/?" +
          {
            "Action"       => action,
            "AWSAccessKeyId"  => ACCESS_KEY_ID,
            "Signature"       => signature,
            "Timestamp"       => timestamp,
            "ResponseGroup"   => responseGroup,
            "Url"           => url
          }.to_a.collect{|item| item.first + "=" + CGI::escape(item.last) }.join("&")     # Put key value pairs into http GET format
       )


print "\n\nRequest:\n\n"
print url

xml  = REXML::Document.new( Net::HTTP.get(url) )

print "\n\nResponse:\n\n"

xml.write

rank = REXML::XPath.first( xml, "//aws:Rank" ).text

print "\n\nTraffic rank: "+rank

