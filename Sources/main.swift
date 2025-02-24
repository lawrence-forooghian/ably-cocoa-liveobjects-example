import Ably
import AblyLiveObjects

let clientOptions = ARTClientOptions(key: "INSERT API KEY HERE")
clientOptions.liveObjectsPlugin = AblyLiveObjects.Plugin.self

let realtime = ARTRealtime(options: clientOptions)
let channel = realtime.channels.get("foo")

print("got the channel")

// Here we demonstrate that we can use the API of LiveObjects
print(channel.liveObjects.someStruct)
channel.liveObjects.doALiveObjectsThing()

// this is what we want to not work
//channel.pluginDataValue(forKey: "hello")
//let foo = PluginAPI.self
//let foo: APLiveObjectsPluginProtocol
//let bar: APLiveObjectsPluginFactoryProtocol
