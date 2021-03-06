const std = @import("std");
const fs = std.fs;
const Json = std.json;
const Client = @import("requestz").Client;

// {"id":"B1K11tBYT6OVo88bHODxC55XiWZEBvKcsi0koJe5SsGyh4c","accountId":"JZO25Xuf5Y0QHfEmXvsDGIc_Or4zB_wowN9ZhB3-nw1ljQ","puuid":"oq8loqZb6CYoxISQ6PK3FUyZuxnMqYwVw4VC1exqlbRTku0sjJTyNF1NH2AafbmyWXYi5Y7N4KEpVw","name":"Suq Mediq","profileIconId":1639,"revisionDate":1616733734000,"summonerLevel":71}

const encrypted_account_id = "JZO25Xuf5Y0QHfEmXvsDGIc_Or4zB_wowN9ZhB3-nw1ljQ";
const api_endpoint_base = "/lol/match/v4/matchlists/by-account";
const api_key = GetApiKey();

/// Function expects API key to be the only thing in the file
fn GetApiKey() ![]u8 {
    var file = try fs.cwd().openFile("api.key", fs.File.OpenFlags{ .read = true });
    defer file.close();

    var buf: [std.mem.page_size]u8 = undefined;
    var bytes = try file.read(buf[0..]);

    // Pop off the newline
    return buf[0 .. bytes - 1];
}

fn GetEncryptedSummonerId(summ_name: []u8) []u8 {
    const region = "na1";
    const enpoint = "https://" + region +
        ".api.riotgames.com/lol/summoner/v4/summoners/by-name/" +
        summ_name + "?api_key=" + api_key;
    // TODO
    return "B1K11tBYT6OVo88bHODxC55XiWZEBvKcsi0koJe5SsGyh4c";
}

pub fn main() !void {
    var client = try Client.init(std.testing.allocator);
    defer client.deinit();

    var response = try client.get("http://httpbin.org/get", .{});
    defer response.deinit();

    var json = try response.json();

    // Work with the json
    std.log.info("json: {}", .{json});
    // json.Value is a hash map
    var map = json.root.Object;

        std.log.info("key: {}, val: {}", .{ key, val });
    }

    std.log.info("end of main()", .{});
}
