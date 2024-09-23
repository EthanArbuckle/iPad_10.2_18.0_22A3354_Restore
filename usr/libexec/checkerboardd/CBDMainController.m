@implementation CBDMainController

- (CBDMainController)init
{
  CBDMainController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *hostDeviceSerialQueue;
  CBDRemoteDeviceConnection *hostDevice;
  CBDLocalServiceServer *v6;
  CBDLocalServiceServer *localXPCServer;
  CBDRemoteDeviceDiscovery *v8;
  CBDRemoteDeviceDiscovery *discovery;
  CBDRemoteXPCMessagePingHandler *v10;
  CBDRemoteXPCMessageSetupHandler *v11;
  CBDRemoteXPCMessageStartDiagnosticsHandler *v12;
  uint64_t v13;
  NSSet *messageHandlers;
  void *v15;
  NSSet *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  CBDRemoteXPCServiceServer *v22;
  CBDRemoteXPCServiceServer *remoteXPCServer;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];

  v29.receiver = self;
  v29.super_class = (Class)CBDMainController;
  v2 = -[CBDMainController init](&v29, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.maccheckerboardd.hostDevice", 0);
    hostDeviceSerialQueue = v2->_hostDeviceSerialQueue;
    v2->_hostDeviceSerialQueue = (OS_dispatch_queue *)v3;

    hostDevice = v2->_hostDevice;
    v2->_hostDevice = 0;

    v6 = objc_alloc_init(CBDLocalServiceServer);
    localXPCServer = v2->_localXPCServer;
    v2->_localXPCServer = v6;

    v8 = objc_alloc_init(CBDRemoteDeviceDiscovery);
    discovery = v2->_discovery;
    v2->_discovery = v8;

    -[CBDRemoteDeviceDiscovery setDelegate:](v2->_discovery, "setDelegate:", v2);
    v10 = objc_opt_new(CBDRemoteXPCMessagePingHandler);
    v11 = -[CBDRemoteXPCMessageSetupHandler initWithProxyReceiver:]([CBDRemoteXPCMessageSetupHandler alloc], "initWithProxyReceiver:", v2->_localXPCServer);
    v12 = -[CBDRemoteXPCMessageStartDiagnosticsHandler initWithProxyReceiver:]([CBDRemoteXPCMessageStartDiagnosticsHandler alloc], "initWithProxyReceiver:", v2->_localXPCServer);
    v13 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, v12, 0));
    messageHandlers = v2->_messageHandlers;
    v2->_messageHandlers = (NSSet *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v16 = v2->_messageHandlers;
    v17 = -[NSSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v26;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v20), "expectedRemoteMessageClasses"));
          objc_msgSend(v15, "unionSet:", v21);

          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v18 = -[NSSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v18);
    }

    v22 = -[CBDRemoteXPCServiceServer initWithAllowedMessageClasses:]([CBDRemoteXPCServiceServer alloc], "initWithAllowedMessageClasses:", v15);
    remoteXPCServer = v2->_remoteXPCServer;
    v2->_remoteXPCServer = v22;

    -[CBDRemoteXPCServiceServer setDelegate:](v2->_remoteXPCServer, "setDelegate:", v2);
  }
  return v2;
}

- (void)start
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = CheckerBoardLogHandleForCategory(11);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CBDMainController: start", v8, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDMainController localXPCServer](self, "localXPCServer"));
  objc_msgSend(v5, "resume");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBDMainController discovery](self, "discovery"));
  objc_msgSend(v6, "resume");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBDMainController remoteXPCServer](self, "remoteXPCServer"));
  objc_msgSend(v7, "resume");

}

- (void)invalidate
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = CheckerBoardLogHandleForCategory(11);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CBDMainController: invalidate", v8, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDMainController localXPCServer](self, "localXPCServer"));
  objc_msgSend(v5, "invalidate");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBDMainController discovery](self, "discovery"));
  objc_msgSend(v6, "invalidate");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBDMainController remoteXPCServer](self, "remoteXPCServer"));
  objc_msgSend(v7, "invalidate");

}

- (void)didConnectDeviceConnection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CBDMainController *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CBDMainController hostDeviceSerialQueue](self, "hostDeviceSerialQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000062B0;
  v7[3] = &unk_10000C620;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)didDisconnectDeviceConnection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CBDMainController *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CBDMainController hostDeviceSerialQueue](self, "hostDeviceSerialQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000646C;
  v7[3] = &unk_10000C620;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)didReceiveRemoteXPCMessage:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = CheckerBoardLogHandleForCategory(11);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "didReceiveRemoteXPCMessage: %@", buf, 0xCu);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBDMainController messageHandlers](self, "messageHandlers", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "expectedRemoteMessageClasses"));
        v18 = objc_msgSend(v16, "containsObject:", objc_opt_class(v6, v17));

        if (v18)
        {
          objc_msgSend(v15, "handleRemoteMessage:completion:", v6, v7);

          goto LABEL_15;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v12)
        continue;
      break;
    }
  }

  v19 = CheckerBoardLogHandleForCategory(11);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Error: no handler for %@", buf, 0xCu);
  }

  v7[2](v7, 0);
LABEL_15:

}

- (CBDRemoteDeviceConnection)hostDevice
{
  return self->_hostDevice;
}

- (void)setHostDevice:(id)a3
{
  objc_storeStrong((id *)&self->_hostDevice, a3);
}

- (OS_dispatch_queue)hostDeviceSerialQueue
{
  return self->_hostDeviceSerialQueue;
}

- (void)setHostDeviceSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_hostDeviceSerialQueue, a3);
}

- (CBDLocalServiceServer)localXPCServer
{
  return self->_localXPCServer;
}

- (void)setLocalXPCServer:(id)a3
{
  objc_storeStrong((id *)&self->_localXPCServer, a3);
}

- (CBDRemoteDeviceDiscovery)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_discovery, a3);
}

- (CBDRemoteXPCServiceServer)remoteXPCServer
{
  return self->_remoteXPCServer;
}

- (void)setRemoteXPCServer:(id)a3
{
  objc_storeStrong((id *)&self->_remoteXPCServer, a3);
}

- (NSSet)messageHandlers
{
  return self->_messageHandlers;
}

- (void)setMessageHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_messageHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageHandlers, 0);
  objc_storeStrong((id *)&self->_remoteXPCServer, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_localXPCServer, 0);
  objc_storeStrong((id *)&self->_hostDeviceSerialQueue, 0);
  objc_storeStrong((id *)&self->_hostDevice, 0);
}

@end
