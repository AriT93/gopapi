module Gopapi
#simple wrapper around gop api
  require 'net/http'
  require 'uri'
  def self.getProxyInfo

    uri = URI.parse(ENV['http_proxy'])
    @proxy_host = uri.host
    @proxy_port = uri.port
    @proxy_user,@proxy_pass = uri.userinfo.split(/:/) if uri.userinfo
  end
  def self.member_getall(api_token)
    getProxyInfo
    Net::HTTP::Proxy(@proxy_host,@proxy_port,@proxy_user,@proxy_pass).start('www.gop.gov'){ |w|
      res = w.post('/api/members.getall', 'api_token='+api_token)
      puts res.body
    }
  end
  def self.member_get(api_token,member_district, member_state)

  end

  def self.member_zip

  end

  def self.member_group

  end
end
