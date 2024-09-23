@implementation BTXPCConnection

- (BTXPCConnection)initWithConnection:(id)a3
{
  id v5;
  BTXPCConnection *v6;
  BTXPCConnection *v7;
  xpc_connection_t *p_connection;
  _xpc_connection_s *connection;
  void *v10;
  NSObject *v11;
  _xpc_connection_s *v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v5 = a3;
  if (os_log_type_enabled((os_log_t)qword_100218BD8, OS_LOG_TYPE_DEBUG))
    sub_10016F178();
  v17.receiver = self;
  v17.super_class = (Class)BTXPCConnection;
  v6 = -[BTXPCConnection init](&v17, "init");
  v7 = v6;
  if (v6)
  {
    p_connection = &v6->_connection;
    objc_storeStrong((id *)&v6->_connection, a3);
    -[BTXPCConnection setRemoteUID:](v7, "setRemoteUID:", xpc_connection_get_euid(v7->_connection));
    -[BTXPCConnection setRemotePID:](v7, "setRemotePID:", xpc_connection_get_pid(v7->_connection));
    objc_initWeak(&location, v7);
    connection = v7->_connection;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "xpcQueue"));
    xpc_connection_set_target_queue(connection, v11);

    v12 = *p_connection;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100090D6C;
    v14[3] = &unk_1001E4CD8;
    objc_copyWeak(&v15, &location);
    xpc_connection_set_event_handler(v12, v14);
    xpc_connection_resume(*p_connection);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (id)description
{
  void *v3;
  _xpc_connection_s *v4;
  pid_t pid;
  _OWORD buffer[4];

  memset(buffer, 0, sizeof(buffer));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCConnection connection](self, "connection"));

  if (v3)
  {
    v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[BTXPCConnection connection](self, "connection"));
    pid = xpc_connection_get_pid(v4);
    proc_name(pid, buffer, 0x40u);

  }
  return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BTXPCConnection(%d-%d): Process Name: %s"), -[BTXPCConnection remotePID](self, "remotePID"), -[BTXPCConnection remoteUID](self, "remoteUID"), buffer));
}

- (void)dealloc
{
  os_log_t v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;

  v3 = sub_1000681B8("XPC");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCConnection description](self, "description"));
    *(_DWORD *)buf = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "XPC client connection dealloc: %@", buf, 0xCu);

  }
  v6.receiver = self;
  v6.super_class = (Class)BTXPCConnection;
  -[BTXPCConnection dealloc](&v6, "dealloc");
}

- (void)handleEvent:(id)a3
{
  id v4;
  xpc_type_t type;
  os_log_t v6;
  NSObject *v7;
  os_log_t v8;

  v4 = a3;
  type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    -[BTXPCConnection handleMsg:](self, "handleMsg:", v4);
  }
  else
  {
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      if (v4 == &_xpc_error_connection_invalid)
      {
        -[BTXPCConnection handleDisconnection](self, "handleDisconnection");
        goto LABEL_10;
      }
      v8 = sub_1000681B8("XPC");
      v7 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_10016F1D8();
    }
    else
    {
      v6 = sub_1000681B8("XPC");
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_10016F238();
    }

  }
LABEL_10:

}

- (void)handleDisconnection
{
  os_log_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = sub_1000681B8("XPC");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCConnection description](self, "description"));
    v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "XPC client disconnection: %@", (uint8_t *)&v7, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  objc_msgSend(v6, "removeConnection:", self);

}

- (void)handleMsg:(id)a3
{
  id v4;
  os_log_t v5;
  NSObject *v6;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  unsigned int v14;
  __int16 v15;
  void *v16;

  v4 = a3;
  v5 = sub_1000681B8("XPC");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[BTXPCConnection remoteUID](self, "remoteUID");
    v8 = -[BTXPCConnection remotePID](self, "remotePID");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
    v12[0] = 67109634;
    v12[1] = v7;
    v13 = 1024;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received XPC(%d-%d) message: %@", (uint8_t *)v12, 0x18u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCConnection connection](self, "connection"));
  objc_msgSend(v10, "handleConnection:XPCMessage:userID:processID:", v11, v4, -[BTXPCConnection remoteUID](self, "remoteUID"), -[BTXPCConnection remotePID](self, "remotePID"));

}

- (void)sendMsg:(id)a3 args:(id)a4
{
  id v6;
  id v7;
  void *v8;
  os_log_t v9;
  NSObject *v10;
  xpc_object_t v11;
  id v12;
  void *v13;
  os_log_t v14;
  NSObject *v15;
  _xpc_connection_s *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_autoreleasePoolPush();
  v9 = sub_1000681B8("XPC");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412547;
    v18 = v6;
    v19 = 2113;
    v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Send message: %@, args: %{private}@", (uint8_t *)&v17, 0x16u);
  }

  v11 = xpc_dictionary_create(0, 0, 0);
  v12 = objc_retainAutorelease(v6);
  xpc_dictionary_set_string(v11, "kMsgId", (const char *)objc_msgSend(v12, "UTF8String"));
  if (v7)
  {
    v13 = (void *)_CFXPCCreateXPCObjectFromCFObject(v7);
    xpc_dictionary_set_value(v11, "kMsgArgs", v13);

  }
  v14 = sub_1000681B8("XPC");
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    sub_10016F298();

  v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[BTXPCConnection connection](self, "connection"));
  xpc_connection_send_message(v16, v11);

  objc_autoreleasePoolPop(v8);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (unsigned)remoteUID
{
  return self->_remoteUID;
}

- (void)setRemoteUID:(unsigned int)a3
{
  self->_remoteUID = a3;
}

- (int)remotePID
{
  return self->_remotePID;
}

- (void)setRemotePID:(int)a3
{
  self->_remotePID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
