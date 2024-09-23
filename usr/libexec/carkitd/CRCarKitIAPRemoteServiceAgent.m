@implementation CRCarKitIAPRemoteServiceAgent

- (CRCarKitIAPRemoteServiceAgent)initWithDelegate:(id)a3
{
  id v4;
  CRCarKitIAPRemoteServiceAgent *v5;
  CRCarKitIAPRemoteServiceAgent *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *rxpcQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *lockdownQueue;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRCarKitIAPRemoteServiceAgent;
  v5 = -[CRCarKitIAPRemoteServiceAgent init](&v12, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    v7 = dispatch_queue_create("com.apple.carkit.remote_xpc_handler_queue", 0);
    rxpcQueue = v6->_rxpcQueue;
    v6->_rxpcQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.carkitd.receive", 0);
    lockdownQueue = v6->_lockdownQueue;
    v6->_lockdownQueue = (OS_dispatch_queue *)v9;

    -[CRCarKitIAPRemoteServiceAgent _startListeners](v6, "_startListeners");
  }

  return v6;
}

- (_lockdown_connection)lock_lockdownConnection
{
  os_unfair_lock_assert_owner(&self->_lock);
  return self->_lock_lockdownConnection;
}

- (void)setLock_lockdownConnection:(_lockdown_connection *)a3
{
  _BOOL8 v5;
  id v6;

  os_unfair_lock_assert_owner(&self->_lock);
  self->_lock_lockdownConnection = a3;
  v5 = -[CRCarKitIAPRemoteServiceAgent _lock_wiredCarPlaySimulatorActive](self, "_lock_wiredCarPlaySimulatorActive");
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent delegate](self, "delegate"));
  objc_msgSend(v6, "setCarPlaySimulatorActive:", v5);

}

- (void)setRxpcConnection:(id)a3
{
  _BOOL8 v4;
  id v5;

  objc_storeStrong((id *)&self->_rxpcConnection, a3);
  os_unfair_lock_lock(&self->_lock);
  v4 = -[CRCarKitIAPRemoteServiceAgent _lock_wiredCarPlaySimulatorActive](self, "_lock_wiredCarPlaySimulatorActive");
  os_unfair_lock_unlock(&self->_lock);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent delegate](self, "delegate"));
  objc_msgSend(v5, "setCarPlaySimulatorActive:", v4);

}

- (BOOL)_lock_wiredCarPlaySimulatorActive
{
  void *v3;

  os_unfair_lock_assert_owner(&self->_lock);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent rxpcConnection](self, "rxpcConnection"));

  return v3 || -[CRCarKitIAPRemoteServiceAgent lock_lockdownConnection](self, "lock_lockdownConnection") != 0;
}

- (void)_setupACCTransportClient
{
  uint64_t v3;
  NSObject *v4;
  _QWORD *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id buf[2];

  v3 = CarGeneralLogging(-[CRCarKitIAPRemoteServiceAgent _cleanupACCTransport](self, "_cleanupACCTransport"));
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up transport", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000371FC;
  v12[3] = &unk_1000B64C8;
  objc_copyWeak(&v13, buf);
  v5 = objc_retainBlock(v12);
  v6 = sub_100037274();
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sharedClient"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "createConnectionWithType:andIdentifier:", 1, 0));
  -[CRCarKitIAPRemoteServiceAgent setConnectionUUID:](self, "setConnectionUUID:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sharedClient"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent connectionUUID](self, "connectionUUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "createEndpointWithTransportType:andProtocol:andIdentifier:andDataOutHandler:forConnectionWithUUID:publishConnection:", 8, 4, 0, v5, v10, 1));
  -[CRCarKitIAPRemoteServiceAgent setEndpointUUID:](self, "setEndpointUUID:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);
}

- (void)_handleLockdownConnection:(_lockdown_connection *)a3 info:(__CFDictionary *)a4
{
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id buf[2];

  v6 = CarGeneralLogging(self);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting new lockdown connection", (uint8_t *)buf, 2u);
  }

  -[CRCarKitIAPRemoteServiceAgent _setupACCTransportClient](self, "_setupACCTransportClient");
  os_unfair_lock_lock(&self->_lock);
  -[CRCarKitIAPRemoteServiceAgent setLock_lockdownConnection:](self, "setLock_lockdownConnection:", a3);
  os_unfair_lock_unlock(&self->_lock);
  objc_initWeak(buf, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003744C;
  v8[3] = &unk_1000B5728;
  objc_copyWeak(&v9, buf);
  -[CRCarKitIAPRemoteServiceAgent _handleReadsWithBlock:](self, "_handleReadsWithBlock:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

- (void)_handleReads
{
  _lockdown_connection *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  _BYTE v17[1024];

  bzero(v17, 0x400uLL);
  os_unfair_lock_lock(&self->_lock);
  v3 = -[CRCarKitIAPRemoteServiceAgent lock_lockdownConnection](self, "lock_lockdownConnection");
  os_unfair_lock_unlock(&self->_lock);
  v4 = lockdown_recv(v3, v17, 1024);
  v5 = v4;
  if (v4 < 0)
  {
    v13 = CarGeneralLogging(v4);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10006CDBC();

    -[CRCarKitIAPRemoteServiceAgent _cleanup](self, "_cleanup");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v17, v4));
    v7 = objc_msgSend(sub_100037274(), "sharedClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent endpointUUID](self, "endpointUUID"));
    objc_msgSend(v8, "processIncomingData:forEndpointWithUUID:", v6, v9);

    v11 = CarGeneralLogging(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134217984;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received bytes: %ld", (uint8_t *)&v15, 0xCu);
    }

  }
}

- (void)_startListeners
{
  _QWORD *v3;
  void *v4;
  void *remote_service_listener;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
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
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id location;

  objc_initWeak(&location, self);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10003787C;
  v37[3] = &unk_1000B64F0;
  objc_copyWeak(&v38, &location);
  v3 = objc_retainBlock(v37);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent rxpcQueue](self, "rxpcQueue"));
  remote_service_listener = (void *)xpc_remote_connection_create_remote_service_listener("com.apple.carkit.remote-iap.service", v4, 0);
  -[CRCarKitIAPRemoteServiceAgent setRxpcListener:](self, "setRxpcListener:", remote_service_listener);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent rxpcListener](self, "rxpcListener"));
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent rxpcListener](self, "rxpcListener"));
    xpc_remote_connection_set_event_handler(v8, v3);

    v9 = objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent rxpcListener](self, "rxpcListener"));
    xpc_remote_connection_activate();
  }
  else
  {
    v10 = CarGeneralLogging(v7);
    v9 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10006CEC0(v9, v11, v12, v13, v14, v15, v16, v17);
  }

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100037904;
  v35[3] = &unk_1000B6518;
  objc_copyWeak(&v36, &location);
  v18 = objc_retainBlock(v35);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent lockdownQueue](self, "lockdownQueue"));
  v20 = lockdown_checkin_xpc("com.apple.carkit.service.lockdown", 0, v19, v18);

  if (v20)
  {
    v22 = CarGeneralLogging(v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_10006CE50(v20, v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent rxpcListener](self, "rxpcListener"));
    if (!v24)
    {
      v26 = CarGeneralLogging(v25);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_10006CE20(v27, v28, v29, v30, v31, v32, v33, v34);

    }
  }

  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

- (void)_sendData:(const char *)a3 length:(unint64_t)a4
{
  void *v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  _lockdown_connection *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  uint8_t buf[16];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent rxpcConnection](self, "rxpcConnection"));

  if (v7)
  {
    v24 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_data(v24, "payload", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent rxpcConnection](self, "rxpcConnection"));
    xpc_remote_connection_send_message(v8, v24);

  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v10 = -[CRCarKitIAPRemoteServiceAgent lock_lockdownConnection](self, "lock_lockdownConnection");
    if (v10)
    {
      v11 = lockdown_send(v10, a3, a4);
      os_unfair_lock_unlock(&self->_lock);
      if (v11 < 0)
      {
        v13 = CarGeneralLogging(v12);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_10006CEF0(v14, v15, v16, v17, v18, v19, v20, v21);

        -[CRCarKitIAPRemoteServiceAgent _cleanup](self, "_cleanup");
      }
    }
    else
    {
      v22 = CarGeneralLogging(0);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "lockdown connection does not exist", buf, 2u);
      }

      os_unfair_lock_unlock(p_lock);
    }
  }
}

- (void)_closeXPCConnection
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent rxpcConnection](self, "rxpcConnection"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent rxpcConnection](self, "rxpcConnection"));
    xpc_remote_connection_cancel();

    -[CRCarKitIAPRemoteServiceAgent setRxpcConnection:](self, "setRxpcConnection:", 0);
  }
}

- (void)_setupXPCEventHandler
{
  void ***v3;
  void *v4;
  void *v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_100037BE4;
  v9 = &unk_1000B64F0;
  objc_copyWeak(&v10, &location);
  v3 = objc_retainBlock(&v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent rxpcConnection](self, "rxpcConnection", v6, v7, v8, v9));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent rxpcConnection](self, "rxpcConnection"));
    xpc_remote_connection_set_event_handler(v5, v3);

  }
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_handleReadsWithBlock:(id)a3
{
  id v4;
  unsigned int socket;
  uintptr_t v6;
  NSObject *v7;
  dispatch_source_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD handler[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  socket = lockdown_get_socket(-[CRCarKitIAPRemoteServiceAgent lock_lockdownConnection](self, "lock_lockdownConnection"));
  os_unfair_lock_unlock(&self->_lock);
  if ((socket & 0x80000000) != 0)
  {
    os_unfair_lock_lock(&self->_lock);
    v12 = CarGeneralLogging(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10006D054(self, v13);

    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v6 = socket;
    v7 = objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent lockdownQueue](self, "lockdownQueue"));
    v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v6, 0, v7);
    -[CRCarKitIAPRemoteServiceAgent setLockdownSource:](self, "setLockdownSource:", v8);

    objc_initWeak(&location, self);
    v9 = objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent lockdownSource](self, "lockdownSource"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000380B0;
    handler[3] = &unk_1000B57A0;
    objc_copyWeak(&v16, &location);
    v15 = v4;
    dispatch_source_set_event_handler(v9, handler);

    v10 = objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent lockdownSource](self, "lockdownSource"));
    dispatch_resume(v10);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

- (void)_cleanup
{
  os_unfair_lock_s *p_lock;
  void *v4;
  NSObject *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent lockdownSource](self, "lockdownSource"));

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent lockdownSource](self, "lockdownSource"));
    dispatch_source_cancel(v5);

    -[CRCarKitIAPRemoteServiceAgent setLockdownSource:](self, "setLockdownSource:", 0);
  }
  lockdown_disconnect(-[CRCarKitIAPRemoteServiceAgent lock_lockdownConnection](self, "lock_lockdownConnection"));
  -[CRCarKitIAPRemoteServiceAgent setLock_lockdownConnection:](self, "setLock_lockdownConnection:", 0);
  os_unfair_lock_unlock(p_lock);
  -[CRCarKitIAPRemoteServiceAgent _cleanupACCTransport](self, "_cleanupACCTransport");
}

- (void)_cleanupACCTransport
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;

  v3 = sub_100037274();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent endpointUUID](self, "endpointUUID"));

  if (v4)
  {
    v6 = CarGeneralLogging(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent endpointUUID](self, "endpointUUID"));
      v28 = 138412290;
      v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Destroying endpoint with UUID', %@", (uint8_t *)&v28, 0xCu);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sharedClient"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent endpointUUID](self, "endpointUUID"));
    v11 = objc_msgSend(v9, "destroyEndpointWithUUID:", v10);

    v13 = CarGeneralLogging(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent endpointUUID](self, "endpointUUID"));
      v16 = NSStringFromBOOL(v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v28 = 138412546;
      v29 = v15;
      v30 = 2112;
      v31 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Destroying endpoint with UUID', %@. Successful?: %@", (uint8_t *)&v28, 0x16u);

    }
    -[CRCarKitIAPRemoteServiceAgent setEndpointUUID:](self, "setEndpointUUID:", 0);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent connectionUUID](self, "connectionUUID"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sharedClient"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent connectionUUID](self, "connectionUUID"));
    v21 = objc_msgSend(v19, "destroyConnectionWithUUID:", v20);

    v23 = CarGeneralLogging(v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarKitIAPRemoteServiceAgent connectionUUID](self, "connectionUUID"));
      v26 = NSStringFromBOOL(v21);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v28 = 138412546;
      v29 = v25;
      v30 = 2112;
      v31 = v27;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Destroying connection with UUID', %@. Successful?: %@", (uint8_t *)&v28, 0x16u);

    }
    -[CRCarKitIAPRemoteServiceAgent setConnectionUUID:](self, "setConnectionUUID:", 0);
  }
}

- (CRCarPlaySimulatorDelegate)delegate
{
  return (CRCarPlaySimulatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)rxpcQueue
{
  return self->_rxpcQueue;
}

- (void)setRxpcQueue:(id)a3
{
  objc_storeStrong((id *)&self->_rxpcQueue, a3);
}

- (OS_xpc_remote_connection)rxpcListener
{
  return self->_rxpcListener;
}

- (void)setRxpcListener:(id)a3
{
  objc_storeStrong((id *)&self->_rxpcListener, a3);
}

- (OS_xpc_remote_connection)rxpcConnection
{
  return self->_rxpcConnection;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSString)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setEndpointUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (OS_dispatch_queue)lockdownQueue
{
  return self->_lockdownQueue;
}

- (void)setLockdownQueue:(id)a3
{
  objc_storeStrong((id *)&self->_lockdownQueue, a3);
}

- (OS_dispatch_source)lockdownSource
{
  return self->_lockdownSource;
}

- (void)setLockdownSource:(id)a3
{
  objc_storeStrong((id *)&self->_lockdownSource, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockdownSource, 0);
  objc_storeStrong((id *)&self->_lockdownQueue, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_rxpcConnection, 0);
  objc_storeStrong((id *)&self->_rxpcListener, 0);
  objc_storeStrong((id *)&self->_rxpcQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
