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
