require 'gopapi'

api_token = "F9F63463-0096-450C-9DE9-E1A35B808046"
#puts Gopapi.member_getall('F9F63463-0096-450C-9DE9-E1A35B808046')
#puts '*******************   BREAK ************************'

##puts Gopapi.member_get(api_token,'00','AK')
#puts Gopapi.bill_get(api_token,"HR1",'111')
puts Gopapi.vote_getall(api_token,'111')
