opkg remove luci-app-multi-frpc
opkg install /tmp/luci-app-multi-frpc_1.0-2_all.ipk
rm -rf /tmp/luci-modulecache/*
rm /tmp/luci-indexcache