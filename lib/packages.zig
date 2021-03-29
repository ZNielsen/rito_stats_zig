const std = @import("std");

pub const network = std.build.Pkg{
    .name = "network",
    .path = "lib/requestz/lib/zig-network/network.zig",
    .dependencies = null,
};

pub const http = std.build.Pkg{
    .name = "http",
    .path = "lib/requestz/lib/h11/lib/http/src/main.zig",
    .dependencies = null,
};

var h11_dependencies = [_]std.build.Pkg{
    http,
};

pub const h11 = std.build.Pkg{
    .name = "h11",
    .path = "lib/requestz/lib/h11/src/main.zig",
    .dependencies = &h11_dependencies,
};

var requestz_dependencies = [_]std.build.Pkg{
    network,
    http,
    h11,
};

pub const requestz = std.build.Pkg{
    .name = "requestz",
    .path = "lib/requestz/main.zig",
    .dependencies = &requestz_dependencies,
};
