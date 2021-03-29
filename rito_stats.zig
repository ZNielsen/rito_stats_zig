const std = @import("std");
const json = std.json;

// Dev API key that needs to be changed every 24 hours
const api_key = "RGAPI-18059214-a277-4eee-a1a5-af15209fa78b"

// {"id":"B1K11tBYT6OVo88bHODxC55XiWZEBvKcsi0koJe5SsGyh4c","accountId":"JZO25Xuf5Y0QHfEmXvsDGIc_Or4zB_wowN9ZhB3-nw1ljQ","puuid":"oq8loqZb6CYoxISQ6PK3FUyZuxnMqYwVw4VC1exqlbRTku0sjJTyNF1NH2AafbmyWXYi5Y7N4KEpVw","name":"Suq Mediq","profileIconId":1639,"revisionDate":1616733734000,"summonerLevel":71}

const encrypted_account_id = "JZO25Xuf5Y0QHfEmXvsDGIc_Or4zB_wowN9ZhB3-nw1ljQ"
const api_endpoint_base = "/lol/match/v4/matchlists/by-account"
