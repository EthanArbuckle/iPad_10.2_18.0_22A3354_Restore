@implementation CBDRemoteXPCServiceServer

- (CBDRemoteXPCServiceServer)initWithAllowedMessageClasses:(id)a3
{
  id v5;
  CBDRemoteXPCServiceServer *v6;
  CBDRemoteXPCServiceServer *v7;
  OS_xpc_remote_connection *listener;
  dispatch_queue_t v9;
  OS_dispatch_queue *serviceQueue;
  dispatch_queue_t v11;
  OS_dispatch_queue *messageQueue;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CBDRemoteXPCServiceServer;
  v6 = -[CBDRemoteXPCServiceServer init](&v14, "init");
  v7 = v6;
  if (v6)
  {
    listener = v6->_listener;
    v6->_listener = 0;

    objc_storeStrong((id *)&v7->_allowedClasses, a3);
    v9 = dispatch_queue_create("com.apple.checkerboard.easyrider.xpc_listener", 0);
    serviceQueue = v7->_serviceQueue;
    v7->_serviceQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_create("com.apple.checkerboard.easyrider.message_handler", 0);
    messageQueue = v7->_messageQueue;
    v7->_messageQueue = (OS_dispatch_queue *)v11;

  }
  return v7;
}

- (void)resume
{
  uint64_t v3;
  NSObject *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *remote_service_listener;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id buf[2];

  v3 = CheckerBoardLogHandleForCategory(11);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "start remote service", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000032A8;
  v12[3] = &unk_10000C468;
  objc_copyWeak(&v13, buf);
  v5 = objc_retainBlock(v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCServiceServer listener](self, "listener"));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCServiceServer serviceQueue](self, "serviceQueue"));
    remote_service_listener = (void *)xpc_remote_connection_create_remote_service_listener("com.apple.maccheckerboardd.remoteservice", v7, 0);
    -[CBDRemoteXPCServiceServer setListener:](self, "setListener:", remote_service_listener);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCServiceServer listener](self, "listener"));
    xpc_remote_connection_set_event_handler(v9, v5);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCServiceServer listener](self, "listener"));
    xpc_remote_connection_set_local_service_version(v10, 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCServiceServer listener](self, "listener"));
    xpc_remote_connection_activate(v11);

  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);
}

- (void)invalidate
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCServiceServer listener](self, "listener"));

  if (v3)
    -[CBDRemoteXPCServiceServer setListener:](self, "setListener:", 0);
}

- (void)_handleError:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;

  v4 = a3;
  v5 = v4;
  if (v4 == &_xpc_error_connection_invalid)
  {
    v15 = CheckerBoardLogHandleForCategory(11);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_100007348(v16, v17, v18, v19, v20, v21, v22, v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCServiceServer invalidationHandler](self, "invalidationHandler"));
    if (v24)
    {
      v25 = objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCServiceServer invalidationHandler](self, "invalidationHandler"));
LABEL_14:
      v36 = (void *)v25;
      (*(void (**)(void))(v25 + 16))();

    }
  }
  else
  {
    if (v4 != &_xpc_error_connection_interrupted)
    {
      v6 = xpc_copy_description(v4);
      v7 = CheckerBoardLogHandleForCategory(11);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1000073A8((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

      free(v6);
      goto LABEL_15;
    }
    v26 = CheckerBoardLogHandleForCategory(11);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_100007378(v27, v28, v29, v30, v31, v32, v33, v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCServiceServer interruptionHandler](self, "interruptionHandler"));
    if (v35)
    {
      v25 = objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCServiceServer interruptionHandler](self, "interruptionHandler"));
      goto LABEL_14;
    }
  }
LABEL_15:

}

- (void)_handleEvent:(id)a3
{
  id v4;
  xpc_connection_t remote_connection;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  CBDRemoteXPCServiceServer *v12;
  id v13;
  uint8_t buf[16];

  v4 = a3;
  remote_connection = xpc_dictionary_get_remote_connection(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(remote_connection);
  v7 = CheckerBoardLogHandleForCategory(11);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting to decode XPC object...", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCServiceServer allowedClasses](self, "allowedClasses"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000037D4;
  v10[3] = &unk_10000C490;
  v11 = v6;
  v12 = self;
  v13 = v4;
  +[NSKeyedUnarchiver unarchiveObjectFromXPCObject:allowedClasses:completion:](NSKeyedUnarchiver, "unarchiveObjectFromXPCObject:allowedClasses:completion:", v13, v9, v10);

}

- (void)_dispatchReceivedMessage:(id)a3 event:(id)a4 client:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[4];
  NSObject *v17;
  CBDRemoteXPCServiceServer *v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCServiceServer delegate](self, "delegate"));
  v12 = objc_opt_respondsToSelector(v11, "didReceiveRemoteXPCMessage:completion:");

  if ((v12 & 1) != 0)
  {
    v13 = objc_claimAutoreleasedReturnValue(-[CBDRemoteXPCServiceServer messageQueue](self, "messageQueue"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100003A38;
    v16[3] = &unk_10000C4E0;
    v17 = v8;
    v18 = self;
    v19 = v9;
    v20 = v10;
    dispatch_async(v13, v16);

    v14 = v17;
  }
  else
  {
    v15 = CheckerBoardLogHandleForCategory(11);
    v14 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000074A0((uint64_t)v8, self);
  }

}

- (void)_sendReply:(id)a3 event:(id)a4 client:(id)a5
{
  id v7;
  id v8;
  xpc_object_t reply;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  char *v16;

  v7 = a5;
  v8 = a3;
  reply = xpc_dictionary_create_reply(a4);
  +[NSKeyedArchiver archiveObject:toXPCObject:](NSKeyedArchiver, "archiveObject:toXPCObject:", v8, reply);

  v10 = xpc_copy_description(reply);
  v11 = CheckerBoardLogHandleForCategory(11);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v7;
    v15 = 2080;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Sending reply to %@: %s", (uint8_t *)&v13, 0x16u);
  }

  free(v10);
  xpc_remote_connection_send_message(v7, reply);

}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CBDRemoteXPCServiceServerDelegate)delegate
{
  return (CBDRemoteXPCServiceServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_xpc_remote_connection)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (void)setServiceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serviceQueue, a3);
}

- (OS_dispatch_queue)messageQueue
{
  return self->_messageQueue;
}

- (void)setMessageQueue:(id)a3
{
  objc_storeStrong((id *)&self->_messageQueue, a3);
}

- (NSSet)allowedClasses
{
  return self->_allowedClasses;
}

- (void)setAllowedClasses:(id)a3
{
  objc_storeStrong((id *)&self->_allowedClasses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedClasses, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

@end
