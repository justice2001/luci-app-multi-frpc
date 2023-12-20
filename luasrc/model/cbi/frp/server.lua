local n = "frp"
local i = require "luci.dispatcher"
local o = require "luci.model.network".init()
local m = require "nixio.fs"
local a, t, e

arg[1] = arg[1]or""

a = Map("frp")
a.title = translate("Frp Server Config")
a.redirect = i.build_url("admin", "services", "frp")

t = a:section(NamedSection, arg[1], "frp")
t.title = translate("Config Server")
t.addremove = false
t.dynamic = false

t:tab("base", translate("Basic Settings"))

e = t:taboption("base", ListValue, "enable", translate("Enable State"))
e.default = "1"
e.rmempty = false
e:value("1", translate("Enable"))
e:value("0", translate("Disable"))


e = t:taboption("base", Value, "name", translate("Server Name"))
e.optional = false
e.rmempty = false

e = t:taboption("base", Value, "server_addr", translate("Server"))
e.optional = false
e.rmempty = false

e = t:taboption("base", Value, "server_port", translate("Port"))
e.datatype = "port"
e.optional = false
e.rmempty = false

e = t:taboption("base", Value, "token", translate("Token"))
e.description = translate("Time duration between server of frpc and frps mustn't exceed 15 minutes.")
e.optional = false
e.password = true
e.rmempty = false

e = t:taboption("base", Value, "user", translate("User"))
e.description = translate("Commonly used to distinguish you with other clients.")
e.optional = true
e.default = ""
e.rmempty = false

return a
