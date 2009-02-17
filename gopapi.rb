module Gopapi
  #module to wrap the calls to gop api should be a class
  #still reading best way to implement that
  require 'net/http'
  require 'uri'

  def self.getGOPXML(method_name,data)
    uri = URI.parse(ENV['http_proxy'])
    proxy_host = uri.host
    proxy_port = uri.port
    proxy_user,proxy_pass = uri.userinfo.split(/:/) if uri.userinfo

    Net::HTTP::Proxy(proxy_host,proxy_port,proxy_user,proxy_pass).start('www.gop.gov'){ |w|
      res = w.post(method_name,data)
      raise RuntimeError.new(res.body) if res.body.match(/^ERROR:*/)
      res.body
    }
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
  def self.bill_keyword(api_token,bill_keyword)
    getGOPXML('/api/bill.keyword','api_token=' + api_token + '&bill_keyword=' + bill_keyword)
  end
  def self.vote_getall(api_token,vote_congress)
    getGOPXML('/api/vote.getall','api_token=' + api_token + '&vote_congress=' + vote_congress)
  end
  def self.vote_member(api_token,vote_roll,vote_congress,member_state,member_district)
    getGOPXML('/api/vote.member','api_token=' + api_token + '&vote_roll=' + vote_roll + '&vote_congress=' + vote_congress + '&member_state=' + member_state + '&member_district=' + member_district)
  end
  def self.legdigest_get(api_token,digest_year,digest_month,digest_day)
    getGOPXML('/api/legdigest.get','api_token=' + api_token + '&digest_year=' + digest_year + '&digest_month=' + digest_month + '&digest_day=' + digest_day)
  end
  def self.legdigest_getall(api_token)
    getGOPXML('/api/legdigest.getall', 'api_token=' + api_token)
  end
  def self.committee_getall(api_token)
    getGOPXML('/api/committee.getall','api_token=' + api_token)
  end
  def self.committee_members(api_token,committee_name,committee_type,committee_parent)
    getGOPXML('/api/committee.members', 'api_token=' + api_token + '&committee_name=' + committee_name + '&committee_type=' + committee_type + '&committee_parent=' + committee_parent)
  end
end
