# LUCI-APP-MULTI-FRPC

> 这是我第一次开发Openwrt插件，也是我开源的第三个项目，可能会有些Bug，欢迎ISSUE！

一款支持多服务端的frp Client Openwrt插件，修改自Lean源码

## ✨ 特性

* 支持多个服务器同时连接
* 支持显示多个服务器的连接日志
* 拆分插件日志

## 🖊️ 使用

您可以在下列地址下载到ipk文件：

* [GitHub Releases](https://github.com/justice2001/luci-app-multi-frpc/releases)
* Gitee Releases - 等待...

您可以使用Openwrt的包管理器的`上传软件包`进行安装，或者将ipk文件上传至openwrt使用`opkg install <package>`安装。

## ℹ️ 信息

项目开发的需求会同步到[Gitea](https://git.mczhengyi.top/zhengyi/luci-app-multi-frpc/issues)，包括我自己提的一些事项都会在这里展示，您可以浏览这里来获取开发动向。

## 🎉 鸣谢

- 该项目基于[luci-app-frpc](https://github.com/coolsnowwolf/luci/tree/master/applications/luci-app-frpc)修改
- 部分代码参考自[luci-app-adguardhome](https://github.com/rufengsuixing/luci-app-adguardhome)

## 🧑‍💻 碎碎念（开发历程和原因）

> 这段只是介绍我的开发原因与经历，可能比较长

我的个人一些服务和网站都是运行在一个内网的服务器中的，由于家用宽带并不允许运行一些应用，因此我采用的是内网穿透的方案来运行对外服务，而我还有一个VPN来访问家中的网路，碍于国内运营商的贷款费用巨贵，因此我选择了Vultr作为中转，虽然延迟很高，但对于在公网看个电影之类的应用也够用，无非就是连接建立比较慢，一旦播放起来就完全没有感受了。既然服务器都买了，带宽也还有很大的富裕，我就想着搭一个frp服务器节点吧，使用DNS把国外的流量导入到这个服务器上。现在我有两个frp服务端，但是Openwrt的插件却只支持单个服务端，找遍了GitHub也没有找到支持多个服务端的frp插件（可能我这种要求比较奇葩吧）。于是，做为一个开发者，我决定自己动手，丰衣足食。开发一款支持多个服务端同时映射的插件，但这是我第一次摸Openwrt的插件开发。网上的文档似乎也不算多，从零开始开发好像也不现实，因此我找出了Lean的luci-app-frpc的源码，分析使用的API，查找API文档，同时也从luci-app-adguardhome中学习到了一些知识。最终搓出了这个插件。