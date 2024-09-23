@implementation GTSimulatorDeviceBrowserXPCProxy

- (GTSimulatorDeviceBrowserXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6;
  id v7;
  GTSimulatorDeviceBrowserXPCProxy *v8;
  __objc2_prot *v9;
  void *v10;
  NSString *v11;
  void *v12;
  unsigned int v13;
  GTServiceConnection *v14;
  void *v15;
  GTServiceConnection *v16;
  GTServiceConnection *connection;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSSet *ignoreMethods;
  GTSimulatorDeviceBrowserXPCProxy *v23;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)GTSimulatorDeviceBrowserXPCProxy;
  v8 = -[GTSimulatorDeviceBrowserXPCProxy init](&v25, "init");
  if (v8)
  {
    v9 = &OBJC_PROTOCOL___GTSimulatorDeviceBrowser;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "protocolName"));
    v11 = NSStringFromProtocol((Protocol *)v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_msgSend(v10, "isEqualToString:", v12);

    if (!v13)
    {

      v23 = 0;
      goto LABEL_6;
    }
    v14 = [GTServiceConnection alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceUDID"));
    v16 = -[GTServiceConnection initWithConnection:device:port:](v14, "initWithConnection:device:port:", v6, v15, objc_msgSend(v7, "servicePort"));
    connection = v8->_connection;
    v8->_connection = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[GTServiceProperties protocolMethods:](GTServiceProperties, "protocolMethods:", v9));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "protocolMethods"));
    v20 = newSetWithArrayMinusArray(v18, v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    ignoreMethods = v8->_ignoreMethods;
    v8->_ignoreMethods = (NSSet *)v21;

  }
  v23 = v8;
LABEL_6:

  return v23;
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
    v10.super_class = (Class)GTSimulatorDeviceBrowserXPCProxy;
    v8 = -[GTSimulatorDeviceBrowserXPCProxy respondsToSelector:](&v10, "respondsToSelector:", a3);
  }

  return v8;
}

- (BOOL)isSimulatorDevice:(id)a3
{
  id v5;
  xpc_object_t empty;
  const char *Name;
  id v8;
  const char *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v5 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  v8 = objc_retainAutorelease(v5);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  xpc_dictionary_set_string(empty, "deviceUDID", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0));
  v11 = v10;
  if (v10)
    v12 = xpc_dictionary_get_BOOL(v10, "returnValue");
  else
    v12 = 0;

  return v12;
}

- (id)deviceProperties:(id)a3 error:(id *)a4
{
  id v7;
  xpc_object_t empty;
  const char *Name;
  id v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  void *nsobject;

  v7 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  v10 = objc_retainAutorelease(v7);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");

  xpc_dictionary_set_string(empty, "deviceUDID", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, a4));
  if (v12)
  {
    v13 = objc_opt_class(GTDeviceProperties);
    nsobject = xpc_dictionary_get_nsobject(v12, "returnValue", v13);
    if (a4)
      *a4 = (id)xpc_dictionary_get_nserror(v12, "error");
  }
  else
  {
    nsobject = 0;
  }

  return nsobject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
