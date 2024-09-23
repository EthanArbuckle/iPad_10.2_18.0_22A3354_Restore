@implementation GTServiceProviderXPCProxy

- (GTServiceProviderXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6;
  id v7;
  GTServiceProviderXPCProxy *v8;
  os_log_t v9;
  OS_os_log *log;
  __objc2_prot *v11;
  void *v12;
  NSString *v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  NSString *deviceUDID;
  GTServiceConnection *v18;
  void *v19;
  GTServiceConnection *v20;
  GTServiceConnection *connection;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSSet *ignoreMethods;
  NSMutableDictionary *v27;
  NSMutableDictionary *observerIdToPort;
  GTServiceProviderXPCProxy *v29;
  NSObject *v30;
  objc_super v32;

  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)GTServiceProviderXPCProxy;
  v8 = -[GTServiceProviderXPCProxy init](&v32, "init");
  if (!v8)
    goto LABEL_4;
  v9 = os_log_create("com.apple.gputools.transport", "ServiceProviderProxy");
  log = v8->_log;
  v8->_log = (OS_os_log *)v9;

  v11 = &OBJC_PROTOCOL___GTServiceProvider;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "protocolName"));
  v13 = NSStringFromProtocol((Protocol *)v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = objc_msgSend(v12, "isEqualToString:", v14);

  if ((v15 & 1) != 0)
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceUDID"));
    deviceUDID = v8->_deviceUDID;
    v8->_deviceUDID = (NSString *)v16;

    v18 = [GTServiceConnection alloc];
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceUDID"));
    v20 = -[GTServiceConnection initWithConnection:device:port:](v18, "initWithConnection:device:port:", v6, v19, objc_msgSend(v7, "servicePort"));
    connection = v8->_connection;
    v8->_connection = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[GTServiceProperties protocolMethods:](GTServiceProperties, "protocolMethods:", v11));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "protocolMethods"));
    v24 = newSetWithArrayMinusArray(v22, v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    ignoreMethods = v8->_ignoreMethods;
    v8->_ignoreMethods = (NSSet *)v25;

    v27 = (NSMutableDictionary *)objc_msgSend(&__NSDictionary0__struct, "mutableCopy");
    observerIdToPort = v8->_observerIdToPort;
    v8->_observerIdToPort = v27;

LABEL_4:
    v29 = v8;
    goto LABEL_8;
  }
  v30 = v8->_log;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    sub_100013888(v30);

  v29 = 0;
LABEL_8:

  return v29;
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
    v10.super_class = (Class)GTServiceProviderXPCProxy;
    v8 = -[GTServiceProviderXPCProxy respondsToSelector:](&v10, "respondsToSelector:", a3);
  }

  return v8;
}

- (id)allServices
{
  xpc_object_t empty;
  const char *Name;
  void *v6;
  uint64_t v7;
  void *nsarray;

  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0));
  if (v6)
  {
    v7 = objc_opt_class(GTProcessService);
    nsarray = (void *)xpc_dictionary_get_nsarray(v6, "returnValue", v7);
  }
  else
  {
    nsarray = 0;
  }

  return nsarray;
}

- (void)registerService:(id)a3 forProcess:(id)a4
{
  id v7;
  xpc_object_t empty;
  const char *Name;
  void *v10;
  void *v11;
  const char *string;
  const char *v13;
  void *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "serviceProperties", (uint64_t)v15);
  xpc_dictionary_set_nsobject(empty, "processInfo", (uint64_t)v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0));
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v15, "setServicePort:", xpc_dictionary_get_uint64(v10, "servicePort"));
    string = xpc_dictionary_get_string(v11, "deviceUDID");
    if (string)
      v13 = string;
    else
      v13 = "";
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v13));
    objc_msgSend(v15, "setDeviceUDID:", v14);

  }
  else
  {
    objc_msgSend(v15, "setServicePort:", 0);
    objc_msgSend(v15, "setDeviceUDID:", 0);
  }

}

- (void)waitForService:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  xpc_object_t empty;
  const char *Name;
  id v11;
  const char *v12;
  GTServiceConnection *connection;
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a4;
  v8 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  v11 = objc_retainAutorelease(v8);
  v12 = (const char *)objc_msgSend(v11, "UTF8String");

  xpc_dictionary_set_string(empty, "protocolName", v12);
  connection = self->_connection;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000129C0;
  v15[3] = &unk_100030950;
  v16 = v7;
  v14 = v7;
  -[GTServiceConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v15);

}

- (BOOL)waitForService:(id)a3 error:(id *)a4
{
  id v7;
  xpc_object_t empty;
  const char *Name;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *nserror;
  void *v15;
  BOOL v16;

  v7 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  v10 = objc_retainAutorelease(v7);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");

  xpc_dictionary_set_string(empty, "protocolName", v11);
  v12 = objc_claimAutoreleasedReturnValue(-[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, a4));
  v13 = (void *)v12;
  if (v12)
  {
    nserror = (void *)xpc_dictionary_get_nserror(v12, "error");
    v15 = nserror;
    v16 = nserror == 0;
    if (a4 && nserror)
      *a4 = objc_retainAutorelease(nserror);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)deregisterService:(unint64_t)a3
{
  const char *Name;
  xpc_object_t xdict;

  xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  xpc_dictionary_set_uint64(xdict, "servicePort", a3);
  -[GTServiceConnection sendMessage:](self->_connection, "sendMessage:", xdict);

}

- (unint64_t)registerObserver:(id)a3
{
  id v5;
  xpc_object_t empty;
  const char *Name;
  GTServiceProviderReplyStream *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t uint64;
  void *v13;
  NSMutableDictionary *observerIdToPort;
  void *v15;

  v5 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  v8 = -[GTServiceProviderReplyStream initWithObserver:]([GTServiceProviderReplyStream alloc], "initWithObserver:", v5);

  v9 = -[GTServiceConnection registerDispatcher:](self->_connection, "registerDispatcher:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceConnection sendMessageWithReplySync:replyStreamId:error:](self->_connection, "sendMessageWithReplySync:replyStreamId:error:", empty, v9, 0));
  v11 = v10;
  if (v10)
  {
    uint64 = xpc_dictionary_get_uint64(v10, "observerId");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v9));
    observerIdToPort = self->_observerIdToPort;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", uint64));
    -[NSMutableDictionary setObject:forKeyedSubscript:](observerIdToPort, "setObject:forKeyedSubscript:", v13, v15);

  }
  else
  {
    uint64 = 0;
  }

  return uint64;
}

- (void)deregisterObserver:(unint64_t)a3
{
  NSMutableDictionary *observerIdToPort;
  void *v7;
  void *v8;
  id v9;
  NSMutableDictionary *v10;
  void *v11;
  const char *Name;
  id v13;
  xpc_object_t xdict;

  observerIdToPort = self->_observerIdToPort;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](observerIdToPort, "objectForKeyedSubscript:", v7));
  v9 = objc_msgSend(v8, "unsignedLongValue");

  v10 = self->_observerIdToPort;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v11);

  xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  xpc_dictionary_set_uint64(xdict, "observerId", a3);
  v13 = -[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", xdict, 0);
  -[GTServiceConnection deregisterDispatcher:](self->_connection, "deregisterDispatcher:", v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerIdToPort, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
