@implementation GTServiceProviderXPCDispatcher

- (GTServiceProviderXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7;
  void *v8;
  id v9;
  GTServiceProviderXPCDispatcher *v10;
  GTServiceProviderXPCDispatcher *v11;
  objc_super v13;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "protocolMethods"));
  v9 = objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "addObject:", CFSTR("broadcastDisconnect"));
  v13.receiver = self;
  v13.super_class = (Class)GTServiceProviderXPCDispatcher;
  v10 = -[GTXPCDispatcher initWithProtocolMethods:](&v13, "initWithProtocolMethods:", v9);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_serviceProvider, a3);

  return v11;
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_registeredConnections, a3);
}

- (void)allServices:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  id v8;
  xpc_object_t reply;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a3;
  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[GTServiceProvider allServices](self->_serviceProvider, "allServices"));
  reply = gt_xpc_dictionary_create_reply(v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(reply);
  if ((objc_msgSend(v7, "isTrusted") & 1) == 0)
  {
    v11 = objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:copyItems:", v8, 1);

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v11;
    v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v8);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v15), "serviceProperties", (_QWORD)v17));
          objc_msgSend(v16, "setDeviceUDID:", 0);

          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }

  }
  xpc_dictionary_set_nsobject(v10, "returnValue", (uint64_t)v8);
  objc_msgSend(v7, "sendMessage:", v10);

}

- (void)registerService_forProcess_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  xpc_object_t reply;
  void *v9;
  uint64_t v10;
  void *nsobject;
  uint64_t v12;
  void *v13;
  NSMutableDictionary *registeredConnections;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSErrorUserInfoKey v22;
  void *v23;
  NSErrorUserInfoKey v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  reply = gt_xpc_dictionary_create_reply(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(reply);
  v10 = objc_opt_class(GTServiceProperties);
  nsobject = xpc_dictionary_get_nsobject(v6, "serviceProperties", v10);
  if (nsobject)
  {
    v12 = objc_opt_class(GTProcessInfo);
    v13 = xpc_dictionary_get_nsobject(v6, "processInfo", v12);
    if (!v13)
    {
      v22 = NSLocalizedDescriptionKey;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid argument sent to service \"%@\": %@"), CFSTR("GTServiceProvider"), CFSTR("Invalid processInfo argument passed to registerService")));
      v23 = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 4, v20));

      xpc_dictionary_set_nserror(v9, "error", v21);
      objc_msgSend(v7, "sendMessage:", v9);

      goto LABEL_7;
    }
    -[GTServiceProvider registerService:forProcess:](self->_serviceProvider, "registerService:forProcess:", nsobject, v13);
    registeredConnections = self->_registeredConnections;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(nsobject, "servicePort")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](registeredConnections, "setObject:forKeyedSubscript:", v7, v15);

    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(nsobject, "deviceUDID")));
    xpc_dictionary_set_string(v9, "deviceUDID", (const char *)objc_msgSend(v16, "UTF8String"));

    xpc_dictionary_set_uint64(v9, "servicePort", (uint64_t)objc_msgSend(nsobject, "servicePort"));
  }
  else
  {
    v24 = NSLocalizedDescriptionKey;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid argument sent to service \"%@\": %@"), CFSTR("GTServiceProvider"), CFSTR("Invalid serviceProperties argument passed to registerService")));
    v25 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 4, v18));

    xpc_dictionary_set_nserror(v9, "error", v13);
  }
  objc_msgSend(v7, "sendMessage:", v9);
LABEL_7:

}

- (void)waitForService_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  xpc_object_t reply;
  void *v9;
  char *string;
  GTServiceProvider *serviceProvider;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a4;
  v7 = a3;
  reply = gt_xpc_dictionary_create_reply(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(reply);
  string = (char *)xpc_dictionary_get_string(v7, "protocolName");

  if (string)
    string = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  serviceProvider = self->_serviceProvider;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000134B0;
  v14[3] = &unk_100030AE0;
  v15 = v9;
  v16 = v6;
  v12 = v6;
  v13 = v9;
  -[GTServiceProvider waitForService:completionHandler:](serviceProvider, "waitForService:completionHandler:", string, v14);

}

- (void)waitForService_error_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  xpc_object_t reply;
  void *v9;
  char *string;
  GTServiceProvider *serviceProvider;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a4;
  v7 = a3;
  reply = gt_xpc_dictionary_create_reply(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(reply);
  string = (char *)xpc_dictionary_get_string(v7, "protocolName");

  if (string)
    string = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  serviceProvider = self->_serviceProvider;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000135E4;
  v14[3] = &unk_100030AE0;
  v15 = v9;
  v16 = v6;
  v12 = v6;
  v13 = v9;
  -[GTServiceProvider waitForService:completionHandler:](serviceProvider, "waitForService:completionHandler:", string, v14);

}

- (void)deregisterService_:(id)a3 replyConnection:(id)a4
{
  uint64_t uint64;
  NSMutableDictionary *registeredConnections;
  id v7;

  uint64 = xpc_dictionary_get_uint64(a3, "servicePort");
  -[GTServiceProvider deregisterService:](self->_serviceProvider, "deregisterService:", uint64);
  registeredConnections = self->_registeredConnections;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", uint64));
  -[NSMutableDictionary removeObjectForKey:](registeredConnections, "removeObjectForKey:", v7);

}

- (void)registerObserver_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  xpc_object_t reply;
  void *v10;
  GTServiceProviderObserver *v11;

  v6 = a4;
  v7 = a3;
  v11 = -[GTServiceObserver initWithMessage:notifyConnection:]([GTServiceProviderObserver alloc], "initWithMessage:notifyConnection:", v7, v6);
  v8 = -[GTServiceProvider registerObserver:](self->_serviceProvider, "registerObserver:", v11);
  reply = gt_xpc_dictionary_create_reply(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(reply);

  xpc_dictionary_set_uint64(v10, "observerId", v8);
  objc_msgSend(v6, "sendMessage:", v10);

}

- (void)deregisterObserver_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  xpc_object_t reply;
  id v9;

  v6 = a4;
  v7 = a3;
  -[GTServiceProvider deregisterObserver:](self->_serviceProvider, "deregisterObserver:", xpc_dictionary_get_uint64(v7, "observerId"));
  reply = gt_xpc_dictionary_create_reply(v7);
  v9 = (id)objc_claimAutoreleasedReturnValue(reply);

  objc_msgSend(v6, "sendMessage:", v9);
}

- (void)broadcastDisconnect:(id)a3 replyConnection:(id)a4
{
  id v6;
  xpc_object_t array;
  id v8;

  v6 = a4;
  array = xpc_dictionary_get_array(a3, "_pathHistory");
  v8 = (id)objc_claimAutoreleasedReturnValue(array);
  -[GTServiceProvider deregisterObserversForConnection:path:](self->_serviceProvider, "deregisterObserversForConnection:path:", v6, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredConnections, 0);
  objc_storeStrong((id *)&self->_serviceProvider, 0);
}

@end
