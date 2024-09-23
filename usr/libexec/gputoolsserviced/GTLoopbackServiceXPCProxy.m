@implementation GTLoopbackServiceXPCProxy

- (GTLoopbackServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6;
  id v7;
  GTLoopbackServiceXPCProxy *v8;
  GTServiceConnection *v9;
  void *v10;
  GTServiceConnection *v11;
  GTServiceConnection *connection;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSSet *ignoreMethods;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)GTLoopbackServiceXPCProxy;
  v8 = -[GTLoopbackServiceXPCProxy init](&v19, "init");
  if (v8)
  {
    v9 = [GTServiceConnection alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceUDID"));
    v11 = -[GTServiceConnection initWithConnection:device:port:](v9, "initWithConnection:device:port:", v6, v10, objc_msgSend(v7, "servicePort"));
    connection = v8->_connection;
    v8->_connection = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[GTServiceProperties protocolMethods:](GTServiceProperties, "protocolMethods:", &OBJC_PROTOCOL___GTLoopbackService));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "protocolMethods"));
    v15 = newSetWithArrayMinusArray(v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    ignoreMethods = v8->_ignoreMethods;
    v8->_ignoreMethods = (NSSet *)v16;

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
    v10.super_class = (Class)GTLoopbackServiceXPCProxy;
    v8 = -[GTLoopbackServiceXPCProxy respondsToSelector:](&v10, "respondsToSelector:", a3);
  }

  return v8;
}

- (id)echo:(id)a3
{
  id v5;
  xpc_object_t empty;
  const char *Name;
  void *v8;
  void *v9;
  id nsdictionary_any;

  v5 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "data", (uint64_t)v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0));
  v9 = v8;
  if (v8)
    nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v8, "data");
  else
    nsdictionary_any = 0;

  return nsdictionary_any;
}

- (void)echo:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  xpc_object_t empty;
  const char *Name;
  GTServiceConnection *connection;
  id v12;
  _QWORD v13[4];
  id v14;

  v7 = a4;
  v8 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "data", (uint64_t)v8);

  connection = self->_connection;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100010CBC;
  v13[3] = &unk_100030950;
  v14 = v7;
  v12 = v7;
  -[GTServiceConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v13);

}

- (void)echo:(id)a3 repeat:(unint64_t)a4 callback:(id)a5
{
  id v9;
  id v10;
  const char *Name;
  GTLoopbackReplyStream *v12;
  xpc_object_t xdict;

  v9 = a5;
  v10 = a3;
  xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  xpc_dictionary_set_nsobject(xdict, "data", (uint64_t)v10);

  xpc_dictionary_set_uint64(xdict, "repeat", a4);
  v12 = -[GTLoopbackReplyStream initWithCallback:]([GTLoopbackReplyStream alloc], "initWithCallback:", v9);

  -[GTLoopbackReplyStream setDispatcherId:](v12, "setDispatcherId:", -[GTServiceConnection registerDispatcher:](self->_connection, "registerDispatcher:", v12));
  -[GTServiceConnection sendMessage:withReplyStreamId:](self->_connection, "sendMessage:withReplyStreamId:", xdict, -[GTLoopbackReplyStream dispatcherId](v12, "dispatcherId"));

}

- (void)echo:(id)a3 repeat:(unint64_t)a4 callback:(id)a5 complete:(id)a6
{
  id v11;
  id v12;
  id v13;
  xpc_object_t empty;
  const char *Name;
  GTLoopbackReplyStream *v16;
  GTServiceConnection *connection;
  id v18;
  GTLoopbackReplyStream *v19;
  id v20;
  _QWORD v21[5];
  GTLoopbackReplyStream *v22;
  id v23;

  v11 = a6;
  v12 = a5;
  v13 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "data", (uint64_t)v13);

  xpc_dictionary_set_uint64(empty, "repeat", a4);
  v16 = -[GTLoopbackReplyStream initWithCallback:]([GTLoopbackReplyStream alloc], "initWithCallback:", v12);

  -[GTLoopbackReplyStream setDispatcherId:](v16, "setDispatcherId:", -[GTServiceConnection registerDispatcher:](self->_connection, "registerDispatcher:", v16));
  connection = self->_connection;
  v18 = -[GTLoopbackReplyStream dispatcherId](v16, "dispatcherId");
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100010F8C;
  v21[3] = &unk_100030BA0;
  v22 = v16;
  v23 = v11;
  v21[4] = self;
  v19 = v16;
  v20 = v11;
  -[GTServiceConnection sendMessage:withReplyStreamId:replyHandler:](connection, "sendMessage:withReplyStreamId:replyHandler:", empty, v18, v21);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
