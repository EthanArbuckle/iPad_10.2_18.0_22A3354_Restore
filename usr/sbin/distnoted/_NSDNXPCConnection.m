@implementation _NSDNXPCConnection

- (void)setHandleMessage:(id)a3
{
  id v4;
  id handleMessage;

  if (self->_started || self->_invalid)
  {
    __break(1u);
  }
  else
  {
    v4 = objc_msgSend(a3, "copy");
    handleMessage = self->_handleMessage;
    self->_handleMessage = v4;

  }
}

- (void)addTerminationImminentHandler:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "copy");
  -[NSMutableArray addObject:](self->_termImminentHandlers, "addObject:", v4);

}

- (void)addInvalidationHandler:(id)a3
{
  id v5;
  NSMutableArray *invalidHandlers;
  id v7;

  v5 = objc_msgSend(a3, "copy");
  invalidHandlers = self->_invalidHandlers;
  v7 = v5;
  -[NSMutableArray addObject:](invalidHandlers, "addObject:");
  if (!invalidHandlers)
    (*((void (**)(id))a3 + 2))(a3);

}

- (void)sendMessage:(id)a3
{
  _NSDNXPCConnection *v4;
  _NSDNXPCConnection *v5;

  if (a3 && xpc_get_type(a3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v4 = self;
    v5 = self;
    if (self->_conn)
    {
      xpc_transaction_begin();
      xpc_connection_send_message(self->_conn, a3);
      xpc_connection_send_barrier(self->_conn, &stru_100008628);
      v5 = self;
    }

  }
  else
  {
    __break(1u);
  }
}

- (_NSDNXPCConnection)initWithXPCConnection:(id)a3 type:(int)a4
{
  _NSDNXPCConnection *v4;
  _xpc_connection_s *v7;
  _NSDNXPCConnection *v8;
  _QWORD handler[6];
  int v11;

  v4 = self;
  if (a3)
  {
    self->_invalidHandlers = objc_opt_new(NSMutableArray);
    v4->_termImminentHandlers = objc_opt_new(NSMutableArray);
    v4->_flavor = a4;
    v7 = (_xpc_connection_s *)xpc_retain(a3);
    v4->_conn = v7;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100001B2C;
    handler[3] = &unk_100008650;
    handler[4] = v7;
    handler[5] = v4;
    v11 = a4;
    xpc_connection_set_event_handler(v7, handler);
    v8 = v4;
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  OS_xpc_object *conn;
  objc_super v4;

  conn = self->_conn;
  if (conn)
    xpc_release(conn);
  v4.receiver = self;
  v4.super_class = (Class)_NSDNXPCConnection;
  -[_NSDNXPCConnection dealloc](&v4, "dealloc");
}

- (_NSDNXPCConnection)initWithServiceName:(id)a3 privileged:(BOOL)a4
{
  _BOOL4 v5;
  UInt8 *v7;
  uint64_t v8;
  xpc_connection_t mach_service;
  _NSDNXPCConnection *v10;
  CFIndex maxBufLen;
  CFRange v13;
  CFRange v14;

  if (!a3)
    return -[_NSDNXPCConnection initWithXPCConnection:type:](self, "initWithXPCConnection:type:", 0, 4);
  v5 = a4;
  maxBufLen = 0;
  v13.length = CFStringGetLength((CFStringRef)a3);
  v13.location = 0;
  CFStringGetBytes((CFStringRef)a3, v13, 0x8000100u, 0, 0, 0, 0, &maxBufLen);
  v7 = (UInt8 *)malloc_type_malloc(maxBufLen + 1, 0x7C7219A6uLL);
  v14.length = CFStringGetLength((CFStringRef)a3);
  v14.location = 0;
  CFStringGetBytes((CFStringRef)a3, v14, 0x8000100u, 0, 0, v7, maxBufLen, 0);
  v7[maxBufLen] = 0;
  if (v5)
    v8 = 2;
  else
    v8 = 0;
  mach_service = xpc_connection_create_mach_service((const char *)v7, 0, v8);
  v10 = -[_NSDNXPCConnection initWithXPCConnection:type:](self, "initWithXPCConnection:type:", mach_service, 4);
  if (mach_service)
    xpc_release(mach_service);
  free(v7);
  return v10;
}

- (_NSDNXPCConnection)initWithEndpoint:(id)a3
{
  xpc_connection_t v4;
  _NSDNXPCConnection *v5;

  v4 = xpc_connection_create_from_endpoint((xpc_endpoint_t)a3);
  v5 = -[_NSDNXPCConnection initWithXPCConnection:type:](self, "initWithXPCConnection:type:", v4, 4);
  xpc_release(v4);
  return v5;
}

- (_NSDNXPCConnection)initWithReceivedConnection:(id)a3
{
  return -[_NSDNXPCConnection initWithXPCConnection:type:](self, "initWithXPCConnection:type:", a3, 5);
}

- (_NSDNXPCConnection)initWithPeerConnection:(id)a3
{
  return -[_NSDNXPCConnection initWithXPCConnection:type:](self, "initWithXPCConnection:type:", a3, 3);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (unsigned)euid
{
  return xpc_connection_get_euid(self->_conn);
}

- (OS_xpc_object)XPCConnection
{
  return self->_conn;
}

- (id)handleMessage
{
  return self->_handleMessage;
}

- (id)__invalidate
{
  id handleMessage;
  NSMutableArray *invalidHandlers;

  handleMessage = self->_handleMessage;
  invalidHandlers = self->_invalidHandlers;
  self->_handleMessage = 0;
  self->_invalidHandlers = 0;

  return invalidHandlers;
}

- (void)__terminationImminent
{
  NSMutableArray *termImminentHandlers;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  termImminentHandlers = self->_termImminentHandlers;
  self->_termImminentHandlers = 0;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](termImminentHandlers, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(termImminentHandlers);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6) + 16))();
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](termImminentHandlers, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)invalidate
{
  int invalid;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  OS_xpc_object *conn;
  int started;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  invalid = self->_invalid;
  self->_invalid = invalid + 1;
  if (invalid)
  {
    v3 = 0;
  }
  else
  {
    v3 = -[NSMutableArray copy](self->_invalidHandlers, "copy");

    self->_invalidHandlers = 0;
    conn = self->_conn;
    if (conn)
    {
      xpc_connection_cancel(conn);
      started = self->_started;
      self->_started = started + 1;
      if (!started)
        xpc_connection_activate(self->_conn);
    }
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i) + 16))();
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)start:(id)a3
{
  int started;

  if (!self->_invalid)
  {
    started = self->_started;
    self->_started = started + 1;
    if (!started)
    {
      if (a3)
        xpc_connection_set_target_queue(self->_conn, (dispatch_queue_t)a3);
      xpc_connection_activate(self->_conn);
    }
  }
}

- (void)sendMessage:(id)a3 waitForAck:(BOOL)a4
{
  _BOOL4 v4;
  _NSDNXPCConnection *v6;
  OS_xpc_object *conn;
  xpc_object_t v8;

  if (a3 && (v4 = a4, xpc_get_type(a3) == (xpc_type_t)&_xpc_type_dictionary))
  {
    xpc_dictionary_set_BOOL(a3, "com.apple.NSXPC.msg_needs_ack", 1);
    v6 = self;
    conn = self->_conn;
    if (conn)
    {
      xpc_retain(self->_conn);
      xpc_transaction_begin();
      if (v4)
      {
        v8 = xpc_connection_send_message_with_reply_sync(conn, a3);
        if (v8)
          xpc_release(v8);
      }
      else
      {
        xpc_connection_send_message(conn, a3);
      }
      xpc_transaction_end();
      xpc_release(conn);
    }
    xpc_dictionary_set_value(a3, "com.apple.NSXPC.msg_needs_ack", 0);

  }
  else
  {
    __break(1u);
  }
}

@end
