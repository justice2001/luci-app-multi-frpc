module("luci.controller.frp", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/frp") then
		return
	end

	entry({"admin", "services", "frp"}, alias("services", "services", "frp", "base"), _("Multi Frpc"), 100).dependent = true
	entry({"admin", "services", "frp", "base"}, cbi("frp/basic"), _("Frp Setting"), 1).leaf = true
	entry({"admin", "services", "frp", "log"}, cbi("frp/log"), _("Plugin Log"), 2).leaf = true
	entry({"admin", "services", "frp", "config"}, cbi("frp/config")).leaf = true
	entry({"admin", "services", "frp", "server"}, cbi("frp/server")).leaf = true
	entry({"admin", "services", "frp", "status"}, call("act_status")).leaf = true
end

function act_status()
	local e = {}
	-- Get PID: ps | grep "/usr/bin/frpc -c /var/etc/frp/frpc.conf" | grep -v grep | awk '{print $1}'
	e.running = luci.sys.call("pidof frpc > /dev/null") == 0
	luci.http.prepare_content("application/json")
	luci.http.write_json(e)
end
