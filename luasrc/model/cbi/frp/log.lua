local fs = require "nixio.fs"
local uci = luci.model.uci.cursor()

f = SimpleForm("log view")
f.reset = false
f.submit = false

t=f:field(TextValue,"conf")
t.rows=26
t.readonly="readonly"
t.wrap = "off"
t.cfgvalue = function(t,t)
return s.readfile("/var/etc/frp/frp.log")or""
end
t.write = function(e,e,e)
end
return f