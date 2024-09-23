@implementation NSXPCListener

+ (id)_maps_mapsConnectionBrokerEndpointSourceListener
{
  return objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.Maps.xpc.connectionBroker.endpointRecorder"));
}

+ (id)_maps_mapsConnectionBrokerEndpointConsumerListener
{
  return objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.Maps.xpc.connectionBroker.endpointProvider"));
}

@end
