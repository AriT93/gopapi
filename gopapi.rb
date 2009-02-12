module Gopapi

  require 'net/http'
  require 'uri'
	#comment for testing
  def self.getGOPXML(method_name,data)
    uri = URI.parse(ENV['http_proxy'])
    @proxy_host = uri.host
    @proxy_port = uri.port
    @proxy_user,@proxy_pass = uri.userinfo.split(/:/) if uri.userinfo

    Net::HTTP::Proxy(@proxy_host,@proxy_port,@proxy_user,@proxy_pass).start('www.gop.gov'){ |w|
      puts method_name
      res = w.post(method_name,data)
      puts res.body
    }
  end
  def self.getProxyInfo
  end
  def self.member_getall(api_token)
    getGOPXML('/api/member.getall','api_token='+api_token)
  end
  def self.member_get(api_token,member_district, member_state)
    getGOPXML('/api/member.get','api_token='+api_token+'&member_district='+member_district+'&member_state='+member_state)
  end
  def self.member_zip(api_token,member_zip,member_zip4)
    getGOPXML('/api/member.zip','api_token=' + api_token + '&member_zip=' + member_zip + '&member_zip4=' + member_zip4)
  end
  def self.member_group(api_token,member_state,member_rssurl,member_gender,member_status)
    getGOPXML('/api/member.group','api_token=' + api_token + '&member_state=' + member_state + '&member_rssurl=' + member_rssurl + '&member_gender=' + member_gender + '&member_status=' + member_status)
  end
  def self.bill_get(api_token,bill_number,bill_congress)
    getGOPXML('/api/bill.get','api_token='+ api_token + '&bill_number=' + bill_number + '&bill_congress=' + bill_congress)
  end
  def self.bill_getall(api_token,bill_congress)
   getGOPXML('/api/bill.getall','api_token='+ api_token + '&bill_congress=' + bill_congress)
  end
end
