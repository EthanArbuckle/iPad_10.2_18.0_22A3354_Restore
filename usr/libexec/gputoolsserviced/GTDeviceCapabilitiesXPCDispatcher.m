@implementation GTDeviceCapabilitiesXPCDispatcher

- (GTDeviceCapabilitiesXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7;
  void *v8;
  GTDeviceCapabilitiesXPCDispatcher *v9;
  objc_super v11;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "protocolMethods"));
  v11.receiver = self;
  v11.super_class = (Class)GTDeviceCapabilitiesXPCDispatcher;
  v9 = -[GTXPCDispatcher initWithProtocolMethods:](&v11, "initWithProtocolMethods:", v8);

  if (v9)
    objc_storeStrong((id *)&v9->_service, a3);

  return v9;
}

- (void)daemonDeviceCapabilities:(id)a3 replyConnection:(id)a4
{
  GTDeviceCapabilities *service;
  id v6;
  id v7;
  xpc_object_t reply;
  void *v9;
  id v10;

  service = self->_service;
  v6 = a4;
  v7 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[GTDeviceCapabilities daemonDeviceCapabilities](service, "daemonDeviceCapabilities"));
  reply = gt_xpc_dictionary_create_reply(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(reply);

  xpc_dictionary_set_nsobject(v9, "returnValue", (uint64_t)v10);
  objc_msgSend(v6, "sendMessage:", v9);

}

- (void)gpuToolsVersionQuery:(id)a3 replyConnection:(id)a4
{
  GTDeviceCapabilities *service;
  id v6;
  id v7;
  xpc_object_t reply;
  void *v9;
  id v10;

  service = self->_service;
  v6 = a4;
  v7 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[GTDeviceCapabilities gpuToolsVersionQuery](service, "gpuToolsVersionQuery"));
  reply = gt_xpc_dictionary_create_reply(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(reply);

  xpc_dictionary_set_nsobject(v9, "returnValue", (uint64_t)v10);
  objc_msgSend(v6, "sendMessage:", v9);

}

- (void)inferiorEnvironment_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  xpc_object_t reply;
  void *v10;
  id nsdictionary_any;

  v6 = a4;
  v7 = a3;
  nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v7, "launchDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GTDeviceCapabilities inferiorEnvironment:](self->_service, "inferiorEnvironment:", nsdictionary_any));
  reply = gt_xpc_dictionary_create_reply(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(reply);

  xpc_dictionary_set_nsobject(v10, "environment", (uint64_t)v8);
  objc_msgSend(v6, "sendMessage:", v10);

}

- (void)deviceCompatibilityCapabilitiesWithHeapDescriptors_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  xpc_object_t reply;
  void *v10;
  id nsdictionary_any;

  v6 = a4;
  v7 = a3;
  nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v7, "heapDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GTDeviceCapabilities deviceCompatibilityCapabilitiesWithHeapDescriptors:](self->_service, "deviceCompatibilityCapabilitiesWithHeapDescriptors:", nsdictionary_any));
  reply = gt_xpc_dictionary_create_reply(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(reply);

  xpc_dictionary_set_nsobject(v10, "returnValue", (uint64_t)v8);
  objc_msgSend(v6, "sendMessage:", v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
