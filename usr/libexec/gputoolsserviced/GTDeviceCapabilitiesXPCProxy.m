@implementation GTDeviceCapabilitiesXPCProxy

- (GTDeviceCapabilitiesXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6;
  id v7;
  GTDeviceCapabilitiesXPCProxy *v8;
  __objc2_prot *v9;
  GTServiceConnection *v10;
  void *v11;
  GTServiceConnection *v12;
  GTServiceConnection *connection;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSSet *ignoreMethods;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)GTDeviceCapabilitiesXPCProxy;
  v8 = -[GTDeviceCapabilitiesXPCProxy init](&v20, "init");
  if (v8)
  {
    v9 = &OBJC_PROTOCOL___GTDeviceCapabilities;
    v10 = [GTServiceConnection alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceUDID"));
    v12 = -[GTServiceConnection initWithConnection:device:port:](v10, "initWithConnection:device:port:", v6, v11, objc_msgSend(v7, "servicePort"));
    connection = v8->_connection;
    v8->_connection = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[GTServiceProperties protocolMethods:](GTServiceProperties, "protocolMethods:", v9));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "protocolMethods"));
    v16 = newSetWithArrayMinusArray(v14, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    ignoreMethods = v8->_ignoreMethods;
    v8->_ignoreMethods = (NSSet *)v17;

  }
  return v8;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  NSSet *ignoreMethods;
  NSString *v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  ignoreMethods = self->_ignoreMethods;
  v6 = NSStringFromSelector(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (-[NSSet containsObject:](ignoreMethods, "containsObject:", v7))
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)GTDeviceCapabilitiesXPCProxy;
    v8 = -[GTDeviceCapabilitiesXPCProxy respondsToSelector:](&v10, "respondsToSelector:", a3);
  }

  return v8;
}

- (id)daemonDeviceCapabilities
{
  xpc_object_t empty;
  const char *Name;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *nsobject_classes;

  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0));
  if (v6)
  {
    v7 = objc_alloc((Class)NSSet);
    v8 = objc_opt_class(DYGTMTLDeviceProfile);
    v9 = objc_opt_class(NSArray);
    v10 = objc_opt_class(NSDictionary);
    v11 = objc_opt_class(NSNumber);
    v12 = objc_msgSend(v7, "initWithObjects:", v8, v9, v10, v11, objc_opt_class(NSString), 0);
    nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v6, "returnValue", v12);

  }
  else
  {
    nsobject_classes = 0;
  }

  return nsobject_classes;
}

- (id)deviceCompatibilityCapabilitiesWithHeapDescriptors:(id)a3
{
  id v5;
  xpc_object_t empty;
  const char *Name;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *nsobject_classes;

  v5 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "heapDescriptors", (uint64_t)v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0));
  if (v8)
  {
    v9 = objc_alloc((Class)NSSet);
    v10 = objc_opt_class(NSArray);
    v11 = objc_opt_class(NSDictionary);
    v12 = objc_opt_class(NSNumber);
    v13 = objc_opt_class(NSData);
    v14 = objc_msgSend(v9, "initWithObjects:", v10, v11, v12, v13, objc_opt_class(NSString), 0);
    nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v8, "returnValue", v14);

  }
  else
  {
    nsobject_classes = 0;
  }

  return nsobject_classes;
}

- (id)gpuToolsVersionQuery
{
  xpc_object_t empty;
  const char *Name;
  void *v6;
  void *v7;
  id nsdictionary_any;

  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0));
  v7 = v6;
  if (v6)
    nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v6, "returnValue");
  else
    nsdictionary_any = 0;

  return nsdictionary_any;
}

- (id)inferiorEnvironment:(id)a3
{
  id v5;
  xpc_object_t empty;
  const char *Name;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *nsdictionary;

  v5 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "launchDictionary", (uint64_t)v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0));
  if (v8)
  {
    v9 = objc_opt_class(NSString);
    v10 = objc_opt_class(NSString);
    nsdictionary = (void *)xpc_dictionary_get_nsdictionary(v8, "environment", v9, v10);
  }
  else
  {
    nsdictionary = 0;
  }

  return nsdictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
