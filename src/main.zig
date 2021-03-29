const std = @import("std");
const fs = std.fs;
const json = std.json;
const Client = @import("requestz").Client;

// {"id":"B1K11tBYT6OVo88bHODxC55XiWZEBvKcsi0koJe5SsGyh4c","accountId":"JZO25Xuf5Y0QHfEmXvsDGIc_Or4zB_wowN9ZhB3-nw1ljQ","puuid":"oq8loqZb6CYoxISQ6PK3FUyZuxnMqYwVw4VC1exqlbRTku0sjJTyNF1NH2AafbmyWXYi5Y7N4KEpVw","name":"Suq Mediq","profileIconId":1639,"revisionDate":1616733734000,"summonerLevel":71}

const encrypted_account_id = "JZO25Xuf5Y0QHfEmXvsDGIc_Or4zB_wowN9ZhB3-nw1ljQ";
const api_endpoint_base = "/lol/match/v4/matchlists/by-account";

/// Function expects API key to be the only thing in the file
fn GetApiKey() ![]u8 {
    var file = try fs.cwd().openFile("api.key", fs.File.OpenFlags{ .read = true });
    defer file.close();

    var buf: [std.mem.page_size]u8 = undefined;
    var bytes = try file.read(buf[0..]);

    // Pop off the newline
    return buf[0 .. bytes - 1];
}

pub fn main() !void {
    const api_key = GetApiKey();

    var client = try Client.init(std.testing.allocator);
    defer client.deinit();

    var response = try client.get("http://httpbin.org/get", .{});
    defer response.deinit();
}
