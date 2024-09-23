@implementation NSXPCConnection

+ (id)_maps_mapsConnectionBrokerEndpointRecorderConnection
{
  return objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.Maps.xpc.connectionBroker.endpointRecorder"), 0);
}

+ (id)_maps_mapsConnectionBrokerEndpointProviderConnection
{
  return objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.Maps.xpc.connectionBroker.endpointProvider"), 0);
}

@end
