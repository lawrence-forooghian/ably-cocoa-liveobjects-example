import Ably
import AblyLiveObjects

let clientOptions = ARTClientOptions(key: "INSERT API KEY HERE")
clientOptions.plugins = [.liveObjects : AblyLiveObjects.Plugin.self]

let realtime = ARTRealtime(options: clientOptions)
let channel = realtime.channels.get("foo")

// Here we demonstrate that we can use the API of LiveObjects
print(channel.liveObjects.someStruct)

Task {
    await channel.liveObjects.doALiveObjectsThing()
}

// Perform some channel activity so we can see that LiveObjects gets passed the protocol messages

channel.attach { error in
    if let error {
        print("error attaching channel: \(error)")
    } else {
        print("attached channel")
    }
}

channel.publish("myName", data: "myData") { error in
    if let error {
        print("error publishing message: \(error)")
    } else {
        print("published message")
    }
}

// this is what we want to not work
//channel.pluginDataValue(forKey: "hello")
//let foo = PluginAPI.self
//let foo: APLiveObjectsPluginProtocol
//let bar: APLiveObjectsPluginFactoryProtocol

RunLoop.main.run()
