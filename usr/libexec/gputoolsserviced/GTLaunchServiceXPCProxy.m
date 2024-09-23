@implementation GTLaunchServiceXPCProxy

- (GTLaunchServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6;
  id v7;
  GTLaunchServiceXPCProxy *v8;
  __objc2_prot *v9;
  void *v10;
  NSString *v11;
  void *v12;
  unsigned int v13;
  GTServiceConnection *v14;
  void *v15;
  GTServiceConnection *v16;
  GTXPCConnection *connection;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSSet *ignoreMethods;
  GTLaunchServiceXPCProxy *v23;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)GTLaunchServiceXPCProxy;
  v8 = -[GTLaunchServiceXPCProxy init](&v25, "init");
  if (v8)
  {
    v9 = &OBJC_PROTOCOL___GTLaunchService;
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
    v8->_connection = (GTXPCConnection *)v16;

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
    v10.super_class = (Class)GTLaunchServiceXPCProxy;
    v8 = -[GTLaunchServiceXPCProxy respondsToSelector:](&v10, "respondsToSelector:", a3);
  }

  return v8;
}

- (BOOL)launchReplayService:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  xpc_object_t empty;
  const char *Name;
  uint64_t v15;
  void *v16;
  void *nserror;
  void *v18;
  BOOL v19;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "environment"));
  v9 = objc_msgSend(v8, "mutableCopy");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sessionUUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("GT_LAUNCH_UUID"));

  v12 = objc_msgSend(v9, "copy");
  objc_msgSend(v7, "setEnvironment:", v12);

  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "request", (uint64_t)v7);

  v15 = objc_claimAutoreleasedReturnValue(-[GTXPCConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, a4));
  v16 = (void *)v15;
  if (v15)
  {
    nserror = (void *)xpc_dictionary_get_nserror(v15, "error");
    v18 = nserror;
    v19 = nserror == 0;
    if (a4 && nserror)
      *a4 = objc_retainAutorelease(nserror);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)foregroundService:(unint64_t)a3 error:(id *)a4
{
  xpc_object_t empty;
  const char *Name;
  uint64_t v10;
  void *v11;
  void *nserror;
  void *v13;
  BOOL v14;

  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_uint64(empty, "servicePort", a3);
  v10 = objc_claimAutoreleasedReturnValue(-[GTXPCConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, a4));
  v11 = (void *)v10;
  if (v10)
  {
    nserror = (void *)xpc_dictionary_get_nserror(v10, "error");
    v13 = nserror;
    v14 = nserror == 0;
    if (a4 && nserror)
      *a4 = objc_retainAutorelease(nserror);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)resumeService:(unint64_t)a3 error:(id *)a4
{
  xpc_object_t empty;
  const char *Name;
  uint64_t v10;
  void *v11;
  void *nserror;
  void *v13;
  BOOL v14;

  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_uint64(empty, "servicePort", a3);
  v10 = objc_claimAutoreleasedReturnValue(-[GTXPCConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, a4));
  v11 = (void *)v10;
  if (v10)
  {
    nserror = (void *)xpc_dictionary_get_nserror(v10, "error");
    v13 = nserror;
    v14 = nserror == 0;
    if (a4 && nserror)
      *a4 = objc_retainAutorelease(nserror);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)symbolicatorForService:(unint64_t)a3 completionHandler:(id)a4
{
  id v7;
  xpc_object_t empty;
  const char *Name;
  GTXPCConnection *connection;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a4;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_uint64(empty, "servicePort", a3);
  connection = self->_connection;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000F3D0;
  v12[3] = &unk_100030950;
  v13 = v7;
  v11 = v7;
  -[GTXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v12);

}

- (void)processStateForService:(unint64_t)a3 completionHandler:(id)a4
{
  id v7;
  xpc_object_t empty;
  const char *Name;
  GTXPCConnection *connection;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a4;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_uint64(empty, "servicePort", a3);
  connection = self->_connection;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000F514;
  v12[3] = &unk_100030950;
  v13 = v7;
  v11 = v7;
  -[GTXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
